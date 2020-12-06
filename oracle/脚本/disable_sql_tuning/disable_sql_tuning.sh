#!/bin/sh


#################################################################################
##### Version  : 1.0
##### Function : Disable sql tuning advisor (Oracle10g or Oracle11g)
#####            
##### Caution  : Run the script by the user who startup oracle database.
#####
#################################################################################


 
ps -ef|grep [o]ra_smon|awk 'sub(/ora_smon_/,"",$NF){print $NF}' | while read i;
do
    instance_name=`echo ${i}|awk '{print $1}'`
    export ORACLE_SID=$instance_name

    ## query database version
    product_name=\'%Database%\'
    dbversion=$(sqlplus -S '/ as sysdba' <<EOF
    set pagesize 100 feedback off heading off linesize 180
    select substr(version,0,2)  from product_component_version where product like $product_name;
EOF)

    if [ $dbversion = "10" ];then
    	sqlplus -S '/ as sysdba'  <<EOF
	set pagesize 150 feedback off heading off linesize 180 trimspool on
	spool ./drop_sqltune_advisor.sql
	select 'exec dbms_sqltune.drop_tuning_task(' || '''' || task_name || '''' || ');'
          from dba_advisor_tasks 
         where advisor_name='SQL Tuning Advisor';
	spool off
        start ./drop_sqltune_advisor.sql
        set pagesize 150 feedback on heading on linesize 180 trimspool on
	select task_name,ADVISOR_NAME,STATUS from dba_advisor_tasks where advisor_name='SQL Tuning Advisor'; 
        exit
EOF
    elif [ $dbversion = "11" ];then
    	sqlplus -S '/ as sysdba'  <<EOF
    	set pagesize 150 feedback off heading on linesize 180 trimspool on
    	col instance_name for a20
    	col client_name for a30
    	col status for a15
    	exec dbms_auto_task_admin.disable (client_name => 'sql tuning advisor',operation => NULL,window_name => NULL);
    	select b.instance_name,a.client_name,a.status from dba_autotask_client a,v\$instance b where client_name='sql tuning advisor';
    	exit
EOF
    fi

done

