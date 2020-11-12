#!/bin/sh


# -----------------------------------------------------------------------------------------
#
# Filename:    run.sh
# Version:     1.0
# Date:        2017-09-14
# Author:      kwq
# Description: get table size
# OS Type:     linux
# Notes:       Run the script by root
#
# -----------------------------------------------------------------------------------------

# required and case-insensitive
INCEPTOR_DIR=/inceptor2/user/hive/warehouse
HIVE_USERNAME=hive
HIVE_PASSWORD=tdh123%
INCEPTOR_SERVER=11.1.205.33

source /etc/profile
source /etc/bashrc
source /root/tdhsoft/TDH-Client/init.sh
### 1. get table size info
export HADOOP_USER_NAME=hive
hadoop fs -ls $INCEPTOR_DIR | grep "db" | awk -F '/' '{ print $NF }' > ./dbname.list
rm -f ./data.txt
for i in `cat ./dbname.list` 
do
    dbname=`echo $i | awk -F '.' '{print $1}' `
    hadoop fs -ls  $INCEPTOR_DIR/$i | grep "db" | awk -F '/' '{ print $NF }'  > ./username.list
    for j in `cat ./username.list` 
    do
        username=$j
        hadoop fs -du $INCEPTOR_DIR/$dbname.db/$username | grep "db" | awk -F '/' '{ print dn,un,$NF,$1 }' dn="$dbname" un="$username"  > ./tableinfo.list
        sed -i 's/[ ][ ]*/,/g' tableinfo.list  
        cat ./tableinfo.list >> data.txt
    done
done

### 2.insert table size info into system.tbsize
hadoop fs -rm -r -f /tmp/system_tbsize
hadoop fs -mkdir /tmp/system_tbsize
hadoop fs -put ./data.txt /tmp/system_tbsize/
baseDir=$(cd `dirname $0`; pwd)
beeline -u jdbc:hive2://${INCEPTOR_SERVER}:10000/system -n $HIVE_USERNAME -p $HIVE_PASSWORD -f $baseDir/insert.sql


### 3.remove temp files
rm -f dbname.list
rm -f username.list
rm -f tableinfo.list
rm -f data.txt


