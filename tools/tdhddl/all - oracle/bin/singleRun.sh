#!/bin/sh


## 1.get variables 
TABLE_OWNER=$2
PASSWORD=$3
OS=$4
EXTERNAL_TABLE_ROOT_DIR_HDFS=`cat ./conf/core.conf | grep EXTERNAL_TABLE_ROOT_DIR_HDFS |  awk -F '=' '{print $2}' `


## 2.check 
if [ "$TABLE_OWNER" = "" ];then
    echo "TABLE_OWNER is null,please check ./conf/core.conf."
    exit
fi
if [ "$EXTERNAL_TABLE_ROOT_DIR_HDFS" = "" ];then
    echo "EXTERNAL_TABLE_ROOT_DIR_HDFS is null,please check ./conf/core.conf."
    exit
fi

## 3.get template.sql
if [ "$1" = "orc" ];then
    cp ./template/template_orc.sql ./template/template.sql
elif [ "$1" = "txt" ]; then
    cp ./template/template_txt.sql ./template/template.sql
elif [ "$1" = "insert" ]; then
    cp ./template/template_insert.sql ./template/template.sql
elif [ "$1" = "es" ]; then
    cp ./template/template_es.sql ./template/template.sql
elif [ "$1" = "hyperdrive" ]; then
    cp ./template/template_hyperdrive.sql ./template/template.sql
elif [ "$1" = "holo" ]; then
    cp ./template/template_holo.sql ./template/template.sql    
elif [ "$1" = "oracle" ]; then
    cp ./template/template_oracle.sql ./template/template.sql 
else
    echo "TABLE_TYPE is error,please check run.sh"
    exit 0
fi


## 4.replace 
## 4.1 replace table owner  
if [ "$OS" = "LINUX" ]; then
    sed  -i "s/XXXXXXX/$TABLE_OWNER/g" ./template/template.sql
elif [ "$OS" = "HPUX" ]; then
    sed  "s/XXXXXXX/$TABLE_OWNER/g" ./template/template.sql > ./template/template.sql.tmp
    mv   ./template/template.sql.tmp ./template/template.sql
fi

## 4.2 replace external table root dir
if [ "$OS" = "LINUX" ]; then
    sed  -i "s/ZZZZZZZ/$EXTERNAL_TABLE_ROOT_DIR_HDFS/g" ./template/template.sql
elif [ "$OS" = "HPUX" ]; then
    sed   "s/ZZZZZZZ/$EXTERNAL_TABLE_ROOT_DIR_HDFS/g" ./template/template.sql > ./template/template.sql.tmp
    mv ./template/template.sql.tmp ./template/template.sql
fi

## 4.3 replace table name
rm -f ./getTdhddl.sql  

if [ "$OS" = "LINUX" ]; then
    sed -i '/^$/d' ./conf/tables.lst 
elif [ "$OS" = "HPUX" ]; then
    sed  '/^$/d' ./conf/tables.lst  > ./conf/tables.lst.tmp
    mv ./conf/tables.lst.tmp ./conf/tables.lst
fi

echo "set line 9999 pages 50000 heading off feedback off trimspool on"   >> ./getTdhddl.sql
for i in ` cat ./conf/tables.lst | tr a-z A-Z `
do
    table_name=`echo $i `
    sed  "s/YYYYYYY/$table_name/g" ./template/template.sql >> ./getTdhddl.sql
    echo "" >>  ./getTdhddl.sql
done

## 5. get tdh ddl
if [ ! -d "./ddl" ]; then
  mkdir ./ddl
fi
sqlplus -s $TABLE_OWNER/$PASSWORD <<EOF
set pagesize 9999 feedback off heading off linesize 9999 trimspool on
spool ./ddl/${TABLE_OWNER}_$1.sql
@./getTdhddl.sql
spool off
EOF
cp ./conf/tables.lst ./ddl/${TABLE_OWNER}_tables.lst

## create table t1(a INTEGER); --> a number(38,0) NUMBER,0)
if [ "$1" = "oracle" ]; then
    if [ "$OS" = "LINUX" ]; then
        sed -i 's/NUMBER,0)/NUMBER(38)/g'  ./ddl/${TABLE_OWNER}_$1.sql
    elif [ "$OS" = "HPUX" ]; then
        sed  "s/NUMBER,0)/NUMBER(38)/g" ./ddl/${TABLE_OWNER}_$1.sql > ./ddl/${TABLE_OWNER}_$1.sql.tmp
        mv ./ddl/${TABLE_OWNER}_$1.sql.tmp ./ddl/${TABLE_OWNER}_$1.sql
    fi
fi


## 6. get oracle comments
if [ "$1" = "oracle" ]; then
    rm  -f ./template/oracle_column.lst
    echo '(' > ./template/oracle_column.lst
    cat ./conf/tables.lst | while read i
    do
        echo "'"$i"'," >> ./template/oracle_column.lst
    done
    
    if [ "$OS" = "LINUX" ]; then
        sed -i '$s/.$//'  ./template/oracle_column.lst
    elif [ "$OS" = "HPUX" ]; then
        sed  '$s/.$//'  ./template/oracle_column.lst  > ./template/oracle_column.lst.tmp
        mv ./template/oracle_column.lst.tmp ./template/oracle_column.lst
    fi
    cp ./template/template_oracle_comments.sql ./get_ora_comments.sql
    cat ./template/oracle_column.lst        >> ./get_ora_comments.sql
    echo ');'                               >> ./get_ora_comments.sql
sqlplus -s $TABLE_OWNER/$PASSWORD <<EOF
set pagesize 9999 feedback off heading off linesize 9999 trimspool on
spool ./ddl/${TABLE_OWNER}_oracle_comments.sql
@./get_ora_comments.sql
spool off
EOF
fi

## 7. remove temp file
rm -f getTdhddl.sql
rm -f get_ora_comments.sql

 
 

