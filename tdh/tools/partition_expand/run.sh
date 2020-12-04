#!/bin/sh


# -----------------------------------------------------------------------------------------
#
# Filename:    run.sh
# Version:     1.0
# Date:        2018-01-12
# Author:      kwq
# Description: Partition table extension script
# OS Type:     linux
# Notes:       Only applicable to range partition tables (day/month/year)
#
# -----------------------------------------------------------------------------------------


INCEPTOR_SERVER=11.1.199.2
USERNAME=hive
PASSWORD=123456
DATABASE_NAME=fdm,mdm

## 1.mkdir
[ -d ./alter_script ]  || mkdir ./alter_script
[ -d ./table_info ]  || mkdir ./table_info
rm -f ./alter_script/*.sql
rm -f ./table_info/*.info


## 2.create alter script
echo $DATABASE_NAME | awk -F ',' '{i=1;while(i<=NF){print $i;i++}}' | while read i;
do
    sh ./bin/generateAlterCommand.sh $INCEPTOR_SERVER $USERNAME $PASSWORD $i
done

## 3.execute
for i in `ls ./alter_script`
do
    beeline -u jdbc:hive2://${INCEPTOR_SERVER}:10000 -n $USERNAME -p $PASSWORD -f ./alter_script/$i
done

## 4.wrong info
if [ `cat ./table_info/*wrong.info | wc -l `  -gt 0 ];then
    echo ""
    echo "##################################### WRONG INFO #####################################"
    cat ./table_info/*wrong.info
fi
