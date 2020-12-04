#!/bin/sh


# --------------------------------------------------------------------
# Filename:    checkTDT.sh
# Version:     1.0
# Date:        2017-3-5
# Author:      kww
# Description: Script to monitor the status of TDT
# Notes:       Run the script by root on TDT server 
# --------------------------------------------------------------------


## mysql info
MYSQL_USER=root
MYSQL_PASSWORD=123456
MYSQL_HOST=CT-1

## the value of alarm threshold
TDT_VIEW_CNT_WARNING_THRESHOLD=10000
TDT_VIEW_CNT_CRITICAL_THRESHOLD=15000


#### 1.check studio.tdt_dataflow_task
failed_cnt=$(mysql -h$MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASSWORD -e"select count(1)  from studio.tdt_dataflow_task where status ='FAILED' ");
ready_cnt=$(mysql -h$MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASSWORD -e"select count(1)  from studio.tdt_dataflow_task where status ='READY' ");

failed_cnt=`echo  $failed_cnt  | awk -F ' ' '{ print $2 }' `
ready_cnt=`echo $ready_cnt | awk -F ' ' '{ print $2 }' `
 
if [ $failed_cnt  -gt 0 ];then
    echo "Critical:the number of failed jobs is $failed_cnt."
fi
if [ $ready_cnt -gt 1 ]; then
    echo "Warning:the number of ready jobs is $ready_cnt."
fi
  
#### 2.check the number of views in tdt database
tdt_view_cnt=$(mysql -h$MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASSWORD -e"select count(1) from metastore_inceptorsql1.views_v where database_name='tdt'; ");
tdt_view_cnt=`echo $tdt_view_cnt | awk -F ' ' '{ print $2 }' `

 
if [ $tdt_view_cnt -ge $TDT_VIEW_CNT_CRITICAL_THRESHOLD ]; then
    echo "Critical:the number of views in tdt database is $tdt_view_cnt."
elif [ $tdt_view_cnt -ge $TDT_VIEW_CNT_WARNING_THRESHOLD ] ;then
    echo "Warning:the number of views in tdt database is $tdt_view_cnt."
fi
   
   
#### 3.check the status of runJob.sh
if [ `ps -ef | grep runJob | wc -l` -lt 2 ];then
    echo "Critical:runJob.sh is not running."
fi


#### 4.check the status of runPoster.sh
if [ `ps -ef | grep runPoster | wc -l` -lt 2 ];then
    echo "Critical:runPoster.sh is not running."
fi


#### 5.check the status of tdt server
/etc/init.d/tda-server status > /tmp/check_tdt_server_status.tmp
if [ `cat /tmp/check_tdt_server_status.tmp | grep 'tda server is running' | wc -l` -lt 1 ];then
    echo "Critical:the tdt server is not running."
fi


   
  