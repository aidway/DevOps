#!/bin/bash

SCRIPT_BASE_PATH=`dirname $0`

## 1. load profile
source /root/.bashrc
source /root/.bash_profile
source /app/tdhfiles/conf/inceptor_grant.conf
source /app/tdhfiles/soft/TDH-Client/init.sh

export LOG_PATH=/app/tdhfiles/log/etl_log

## 2. execute sql
beeline  -u jdbc:hive2://${INCEPTOR_SERVER}:10000/default -n ${INCEPTOR_USERNAME} -p ${INCEPTOR_PASSWORD} -f $SCRIPT_BASE_PATH/sql/grant.sql  >> $LOG_PATH/grant_`date +"%Y%m%d"`.log 2>&1

echo "The run_mssad_grant.sh run successfully. "
