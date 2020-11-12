#!/bin/bash

# ----------------------------------------------------------------------
# Title: checkProcess
# Description: when service NameNode is down,restart
# author: lei.sun
# date£: 2016-12-26
# version: v1.0
# ----------------------------------------------------------------------

myPath="/var/log/checkProcess/log/"
today=`date +%Y%m%d`
dir="/etc/init.d/"
log1="/var/log/"

function CheckProcess()
{
     # Check whether the parameter is present
        if [ "$1" = "" ];then
            echo "$1"
            exit 0
        fi
        
     # check where exists exec file of hdfs
        if [ ! -f "$dir$1" ];then
            echo "$dir$1 not exits.Please check your file"
            exit 0
        fi
              
     # check whether service of namenode is running
        service $1 status
        if [ $? != 0 ];then
            sleep 5
        
      # check whether exists log dir and backup namenode logs  
            if [ ! -d "$myPath$today" ]; then
               sudo  mkdir -p "$myPath$today"
            fi
            service=`echo $1 |awk -F\- '{print $NF}'`
            
            sudo  bash -c "find $log1$service/ -mtime 0 |xargs -i cp {} $myPath$today "
            sudo  bash -c "sar -A >>$myPath$today/sar.out"
            sudo  bash -c "dmesg  >>"$myPath$today"/dmest.out"
            echo  "logs has backed."          
     
         # start service of NameNode
            echo "start $1"
            sudo  service $1 start
        fi
}

while [ 1 ]; do

    CheckProcess hadoop-hdfs-zkfc-hdfs1
    CheckProcess hadoop-hdfs-namenode-hdfs1

sleep 60

done
exit 0

