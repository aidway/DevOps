#/bin/sh

if [ "$username" = "" ];then
	echo "Please input username!"
	exit
fi

if [ "$password" = "" ];then
	echo "Please input password!"
	exit
fi

if [ "$ORACLE_SID" = "" ];then
	echo "Please input ORACLE_SID!"
	exit
fi

export ORACLE_SID=$ORACLE_SID
sqlplus -S  $username/$password <<EOF
set pagesize 1000 feedback off heading off linesize 180 trimspool on
spool /tmp/grant_privs_to_dbview.sql
select 'grant select on ' || a.table_name || ' to dbview;' sql
  from user_tables a
 where not exists (select 1
          from user_tab_privs b
         where a.table_name = b.table_name
           and b.grantee = 'DBVIEW');
select 'grant select on ' || a.view_name || ' to dbview;' sql
  from user_views a
 where not exists (select 1
          from user_tab_privs b
         where a.view_name = b.table_name
           and b.grantee = 'DBVIEW');
spool off
start /tmp/grant_privs_to_dbview.sql
exit
EOF


if [ `cat /tmp/grant_privs_to_dbview.sql | wc -l` -eq 0 ];then
    echo "No new application tables needed to be granted to dbview!"
else
    echo ""
    echo "The scripts finished successfully!"
fi
