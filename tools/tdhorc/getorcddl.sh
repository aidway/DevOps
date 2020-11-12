#!/bin/sh

INCEPTOR_SERVER=11.1.199.6
DBNAME=mas
USERNAME=mas
PASSWORD=123456

rm -rf ./sql
mkdir ./sql

for i in ` cat ./tables.lst  `
do
    TABLE_NAME=`echo $i `
    beeline --outputformat=csv --showHeader=false --verbose=false --silent=true -u  jdbc:hive2://$INCEPTOR_SERVER:10000/$DBNAME -n $USERNAME -p $PASSWORD -e "show create table $TABLE_NAME" | sed 's/"//g' | sed '/ROW FORMAT SERDE/,$d'>  ./sql/$TABLE_NAME.tmp
    echo "stored as orc "  >> ./sql/$TABLE_NAME.tmp
    echo 'tblproperties ("transactional"="true");' >> ./sql/$TABLE_NAME.tmp
    flag=0
    cat ./sql/$TABLE_NAME.tmp | while read j
    do
        if [ `echo $j | grep "PARTITIONED BY" | wc -l ` -gt 0 ];then
            flag=1
        fi
        if [ $flag = 1 ];then
            echo $j | sed "s/COMMENT.*'//g"  >> ./sql/$TABLE_NAME.sql
        else
            echo "$j" >> ./sql/$TABLE_NAME.sql
        fi
    done
    sed -i 's/;//g' ./sql/$TABLE_NAME.sql
    echo ";" >> ./sql/$TABLE_NAME.sql
    rm -f ./sql/$TABLE_NAME.tmp
done



sed -i 's/,ORACLE//g' ./sql/*.sql
