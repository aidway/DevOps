#!/bin/sh

#########################################################################################################
#
# Description:Insert the sql_id in the sqlid_config file into sys.cebdba_sql_base_info.
# Version:1.0
# Date:2015-11-18
#
# NOTE:run the script by oracle
# 
#########################################################################################################


## check sqlid_config
if ! [ -f ./sqlid_config ];then
	echo "The sqlid_config file does not exist,please check."
	exit
fi


## read instance_name
instance_name=`cat ./sqlid_config | grep instance_name= | awk  -F '=' '{print $2}'`

if [ `ps -ef | grep ora_ | grep $instance_name | wc -l` -le 0 ];then
	echo "The instance $instance_name does not exist,please check sqlid_config."
	exit
fi


## read sqlid_config
sql_id_str=""
for j in `cat ./sqlid_config | grep sql_id= | awk  -F '=' '{print $2}'  | awk -F ',' '{i=1;while(i<=NF){print $i;i++}}'`
do
	sql_id_str=$sql_id_str,\'$j\'
done
sql_id_str=\'\'$sql_id_str


## insert into sys.cebdba_sql_base_info
export ORACLE_SID=$instance_name
sqlplus -s / as sysdba <<EOF
set pagesize 999 feedback off heading off linesize 180 trimspool on
spool ./insertsqlbaseinfo.sql
select 'insert into sys.cebdba_sql_base_info(sql_id,parsing_schema_name,elapsed_time_base) 
        values(' || '''' || sql_id || '''' || ',' || '''' || PARSING_SCHEMA_NAME || '''' || ',' ||
       ELAPSED_TIME_BASE || ');' sql
  from (select a.sql_id,
               a.parsing_schema_name,
               min(round(a.elapsed_time_delta / a.executions_delta)) elapsed_time_base
          from dba_hist_sqlstat a, dba_hist_snapshot b
         where a.sql_id in ($sql_id_str)
           and a.snap_id = b.snap_id
           and a.executions_delta > 0
           and a.elapsed_time_delta > 0
           and b.begin_interval_time >= sysdate - 8
         group by a.sql_id, a.parsing_schema_name);
spool off
start ./insertsqlbaseinfo.sql
commit;
exit
EOF


