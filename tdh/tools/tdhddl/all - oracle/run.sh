#!/bin/sh


# -----------------------------------------------------------------------------------------
#
# Filename:    run.sh
# Version:     1.0
# Date:        2017-2-27
# Author:      kww
# Description: Oracle DDL to TDH DDL(txt/hyperdrive/es/orc/holodesk/insert)
# OS Type:     linux/hp-ux
# Notes:       Run the script by the user which start the instance,default is oracle 
#
# -----------------------------------------------------------------------------------------



## get variables from ./conf/core.conf
TABLE_OWNER=`cat ./conf/core.conf | grep TABLE_OWNER= | awk -F '=' '{print $2}'  | tr a-z A-Z `
PASSWORD=`cat ./conf/core.conf | grep PASSWORD= | awk -F '=' '{print $2}' `
RUN_TYPE=`cat ./conf/core.conf | grep RUN_TYPE= | awk -F '=' '{print $2}' `
EXTERNAL_TABLE_ROOT_DIR_HDFS=`cat ./conf/core.conf | grep EXTERNAL_TABLE_ROOT_DIR_HDFS |  awk -F '=' '{print $2}' `


if [ `uname -a | grep -i HP-UX | wc -l` -gt 0 ];then
    OS=HPUX
elif [ `uname -a | grep -i Linux | wc -l` -gt 0 ];then
    OS=LINUX
else
    echo "OS must be linux or hp-ux,please check."
    exit 0
fi

## 1.check core.conf
if [ "$TABLE_OWNER" = "" ];then
    echo "TABLE_OWNER is null,please check ./conf/core.conf"
    exit
fi

if [ "$RUN_TYPE" = "" ];then
    echo "RUN_TYPE is null,please check ./conf/core.conf"
    exit 0
elif [ "$RUN_TYPE" != "USER" -a "$RUN_TYPE" != "TABLE" ];then
    echo "RUN_TYPE must in USER or TABLE,please check ./conf/core.conf"
    exit 0
#elif [ "$RUN_TYPE" = "USER" ]; then
#    if [ `cat ./conf/core.conf | grep TABLE_OWNER= | grep -o , | wc -l ` -ne `cat ./conf/core.conf | grep PASSWORD= | grep -o , | wc -l ` ];then
#        echo "The number of TABLE_OWNER should be equal to PASSWORD,please check ./conf/core.conf"
#        exit 0
#    fi
#elif [ "$RUN_TYPE" = "TABLE" ]; then
#    if [ `cat ./conf/core.conf | grep TABLE_OWNER= | grep -o , | wc -l ` -gt 0 ];then
#        echo "If RUN_TYPE is TABLE,there can have only one user in TABLE_OWNER,please check ./conf/core.conf"
#        exit 0
#    fi
fi


## 2.get tdh ddl
cnt=1
echo $TABLE_OWNER | awk -F ',' '{i=1;while(i<=NF){print $i;i++}}' | while read i;
do
    TABLE_OWNER2=`echo $i`
    PASSWORD2=`echo $PASSWORD | awk -F ',' '{print $"'$cnt'"}'`
    
    if [ "$RUN_TYPE" = "USER" ];then
        sqlplus -s $TABLE_OWNER2/$PASSWORD2 <<EOF
        set pagesize 9999 feedback off heading off linesize 9999 trimspool on
        spool ./conf/tables.lst
        select distinct table_name from user_tables order by table_name asc;
        spool off
EOF
    fi
    
    for j in orc txt insert es hyperdrive holo oracle
    do
        sh ./bin/singleRun.sh $j $TABLE_OWNER2  $PASSWORD2 $OS
    done 
    
    cnt=` expr $cnt + 1 `
done



