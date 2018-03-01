#!/bin/sh

## 根据buckets.conf的配置，将指定orc.sql中的分桶字段和分桶数目进行替换

## required
OWNER=


OWNER=`echo $OWNER | tr a-z A-Z`
if  ! [ -f ../ddl/${OWNER}_orc.sql ];then
    echo "../ddl/${OWNER}_orc.sql does not exists,please check."
    exit 0
fi

echo '' > ./${OWNER}_orc.sql
cat ../ddl/${OWNER}_orc.sql | while read i
do
    if [ ` echo $i | grep create | wc -l` -gt 0 ];then
        table_name=`echo $i | awk -F ' ' '{print $3}'`
        column_name=`cat buckets.conf | grep -i -w $table_name | awk -F ',' '{print $2}'`
        buckets=`cat buckets.conf | grep -i -w $table_name | awk -F ',' '{print $3}'`
    fi
    if [ ` echo $i | grep clustered | wc -l` -gt 0 ];then
        echo $i > tmp1
        sed -i  "s/COLUMN/$column_name/" tmp1
        sed -i "s/NN/$buckets/" tmp1
        cat tmp1 >> ./${OWNER}_orc.sql
    elif [ ` echo $i | grep -w SYSTIME  | wc -l` -gt 0 ];then
        echo $i > tmp1
        sed -i  's/SYSTIME/`SYSTIME`/' tmp1
        cat tmp1 >> ./${OWNER}_orc.sql
    else
        echo $i >> ./${OWNER}_orc.sql
    fi
done

rm -rf tmp1