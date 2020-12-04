#!/bin/sh

###########################
##### Version  : 2.0
##### Function : This script is used to grant select privilege on new tables or views to dbview.
#####            If only one application user's privileges is granted to dbview,corresponding synonyms for dbview is also created.
##### Caution  : Run the script by ROOT user.
#####
###########################

curr_path=`pwd`
script_path=$curr_path/grant_privs_dbview

if [ -d $curr_path/grant_privs_dbview ];then
	rm -r ./grant_privs_dbview
fi
mkdir $curr_path/grant_privs_dbview
chmod -R 777 grant_privs_dbview
 

if [ `whoami` != "root" ];then
    echo "Please run the script by ROOT user!"
	exit	
fi
 
ps -ef|grep [o]ra_smon|awk 'sub(/ora_smon_/,"",$NF){print $1,$NF}' | while read i;
do

    oracle_user=`echo ${i}|awk '{print $1}'`
    instance_name=`echo ${i}|awk '{print $2}'`
   
    if [ "$oracle_user" = ""  ];then
		echo "Instance $instance_name does not exists,please check.">> $script_path/error.log
		continue
    fi
	##### create grant_tables_privs.sql
    su - "${oracle_user}" <<EOO >/dev/null 2>&1
    export ORACLE_SID=$instance_name
    sqlplus -S '/ as sysdba' > $script_path/grant_$instance_name.log <<EOF
    set pagesize 100 feedback off heading off linesize 180 trimspool on
    spool $script_path/grant_tables_privs_$instance_name.sql
    select 'grant select on ' || a.owner || '.' || a.table_name || ' to dbview;' sql
      from dba_tables a
     where owner in (select distinct owner from dba_tab_privs where grantee = 'DBVIEW')
       and not exists (select 1
               from dba_tab_privs b
              where a.owner = b.owner
                and a.table_name = b.table_name
                and b.grantee = 'DBVIEW');
    spool off
	
	--- create grant_views_privs.sql
	spool $script_path/grant_views_privs_$instance_name.sql
	select 'grant select on ' || a.owner || '.' || a.view_name || ' to dbview;' sql
      from dba_views a
     where owner in (select distinct owner from dba_tab_privs where grantee = 'DBVIEW')
       and not exists (select 1
               from dba_tab_privs b
              where a.owner = b.owner
                and a.view_name = b.table_name
                and b.grantee = 'DBVIEW');   
	spool off
	
	--- create create_synonyms.sql
	spool $script_path/create_synonyms_$instance_name.sql
	select 'create synonym dbview.' || a.OBJECT_NAME || ' for ' || a.owner || '.' || a.OBJECT_NAME || ';' sql
      from dba_objects a
     where a.OWNER in (select table_owner from dba_synonyms a where owner = 'DBVIEW')
       and not exists (select 1
                         from dba_synonyms b
                        where a.owner = b.table_owner
                          and a.object_name = b.table_name
                          and b.OWNER='DBVIEW');
    spool off
	
	--- executive related scripts
	@$script_path/grant_tables_privs_$instance_name.sql
	@$script_path/grant_views_privs_$instance_name.sql
	@$script_path/create_synonyms_$instance_name.sql
    exit	
EOF
EOO
	echo "Instance $instance_name is finished,please check $script_path/grant_$instance_name.log "
done
	




