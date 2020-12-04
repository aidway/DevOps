#!/bin/bash

SCRIPT_BASE_PATH=`dirname $0`

## 1. load profile
source /root/.bashrc
source /root/.bash_profile
source /app/tdhfiles/conf/inceptor_grant.conf
source /app/tdhfiles/soft/TDH-Client/init.sh

export LOG_PATH=/app/tdhfiles/log/etl_log

## 2. execute sql
echo '' > $LOG_PATH/etl_`date +"%Y%m%d"`.log
for i in `cat $SCRIPT_BASE_PATH/conf/sql_list.conf`
do
    echo "execute" $i
    beeline -u jdbc:hive2://${INCEPTOR_SERVER}:10000/${INCEPTOR_DB} -n ${INCEPTOR_USERNAME} -p ${INCEPTOR_PASSWORD} -f $SCRIPT_BASE_PATH/sql/$i  >> $LOG_PATH/etl_`date +"%Y%m%d"`.log 2>&1
done


## 3. update database version
beeline   -u jdbc:hive2://${INCEPTOR_SERVER}:10000/${INCEPTOR_DB} -n ${INCEPTOR_USERNAME} -p ${INCEPTOR_PASSWORD} -e "truncate table  mssad_db.bas_db_version ; "  >> $LOG_PATH/etl_`date +"%Y%m%d"`.log 2>&1
beeline   -u jdbc:hive2://${INCEPTOR_SERVER}:10000/${INCEPTOR_DB} -n ${INCEPTOR_USERNAME} -p ${INCEPTOR_PASSWORD} -e "INSERT INTO mssad_db.bas_db_version SELECT 'mssad_db','1.2.0',SYSDATE FROM system.dual "  >> $LOG_PATH/etl_`date +"%Y%m%d"`.log 2>&1



echo 'The run_create_proc.sh run  successfully.'
