#!/bin/sh


# -----------------------------------------------------------------------------------------
#
# Filename:    run.sh
# Version:     1.0
# Date:        2019-03-13
# Author:      kwq
# Description: get orc table bucket info
# OS Type:     linux
# TDH version: 4.x
#
# -----------------------------------------------------------------------------------------


## bucket_size_txt location
TXT_TABLE_LOC=/tmp/bucket_size_txt

## db info
INCEPTOR_DIR=/inceptorsql1/user/hive/warehouse/
HIVE_USERNAME=hive
HIVE_PASSWORD=123456
INCEPTOR_SERVER=192.168.1.36
INCEPTOR_DB=system

## YES or NO
TRUNCATE_OR_NOT=YES


## 1.kinit
## kinit ...

## 2.get bucket info
hadoop fs -ls -R $INCEPTOR_DIR | grep -v '__META__' | grep -v '^d' | grep 'bucket'  > ./dbfile_info

cat ./dbfile_info | awk -F ' ' '{print $5}'  > ./bucket_size_info

cat ./dbfile_info | awk -F ' ' '{print $NF}' | awk -F '/' -v OFS=',' '{if ($9 ~ /^delta/  || $9 ~ /^base/) {print $6,$7,$8,"NULL",$9,$10,$11} else {print $6,$7,$8,$9,$10,$11}}' | sed  's/,$//' > ./bucket_name_info


if [ `cat ./bucket_size_info | wc -l` -ne `cat ./bucket_name_info | wc -l` ];then
    echo "The number of bucket_size_info and bucket_name_info are different,please check!"
    exit
fi


## 3.paste
paste  ./bucket_name_info ./bucket_size_info -d "," > ./bucket_all_info


## 4.put bucket_all_info to hdfs
hadoop fs -rm -skipTrash /tmp/bucket_size_txt/bucket_all_info
hadoop fs -put ./bucket_all_info /tmp/bucket_size_txt
 

## 5.process data
baseDir=$(cd `dirname $0`; pwd)
if [ ${TRUNCATE_OR_NOT} == "YES" ];then
    beeline -u jdbc:hive2://${INCEPTOR_SERVER}:10000/${INCEPTOR_DB} -n $HIVE_USERNAME -p $HIVE_PASSWORD -f $baseDir/truncate.sql
fi
beeline -u jdbc:hive2://${INCEPTOR_SERVER}:10000/${INCEPTOR_DB} -n $HIVE_USERNAME -p $HIVE_PASSWORD -f $baseDir/insert.sql



## 6.rm temp file
rm -f ./bucket_all_info
rm -f ./bucket_name_info
rm -f ./bucket_size_info
rm -f ./dbfile_info

