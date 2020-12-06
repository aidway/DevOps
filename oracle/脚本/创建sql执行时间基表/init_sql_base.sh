#!/bin/sh

#########################################################################################################
#
# Description:create table sys.cebdba_sql_base_info and then init it.
# Version:1.0
# Date:2015-11-18
#
# NOTE:run the script by oracle
# 
#########################################################################################################


# check sqlid_config
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

## create table sys.cebdba_sql_base_info
export ORACLE_SID=$instance_name
sqlplus -s / as sysdba <<EOF
start ./create_cebdba_sql_base_info.sql
commit;
exit
EOF

## init sys.cebdba_sql_base_info
sh ./initsqlbaseinfo.sh



echo "Scripts finished!"
