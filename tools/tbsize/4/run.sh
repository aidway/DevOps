#!/bin/sh


# -----------------------------------------------------------------------------------------
#
# Filename:    run.sh
# Version:     1.0
# Date:        2019-03-08
# Author:      kwq
# Description: get table size
# OS Type:     linux
# TDH Version：4.8.x
# -----------------------------------------------------------------------------------------

# required and case-insensitive
INCEPTOR_DIR=/inceptorsql1/user/hive/warehouse
HIVE_USERNAME=hive
HIVE_PASSWORD=hive123456
INCEPTOR_SERVER=10.3.148.68
INCEPTOR_DB=system



### 1.kerberos kinit
kinit -kt /etc/hdfs1/conf/hdfs.keytab hdfs/dbclusternode002@TDH


### 2. get table size info
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

### 3.insert table size info into tbsize
hadoop fs -rm /tmp/system_tbsize/data.txt
hadoop fs -put ./data.txt /tmp/system_tbsize/
baseDir=$(cd `dirname $0`; pwd)
beeline -u jdbc:hive2://${INCEPTOR_SERVER}:10000/${INCEPTOR_DB} -n $HIVE_USERNAME -p $HIVE_PASSWORD -f $baseDir/insert.sql


### 4.remove temp files
rm -f ./dbname.list
rm -f ./username.list
rm -f ./tableinfo.list
rm -f ./data.txt


