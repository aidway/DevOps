#!/bin/sh


# -----------------------------------------------------------------------------------------
#
# Filename:    run.sh
# Version:     1.0
# Date:        2017-7-3
# Author:      kww
# Description: Check info of the orc tables.
# OS Type:     linux
# Notes:       
#
# -----------------------------------------------------------------------------------------

SERVER_IP=`cat ./conf/core.conf | grep -w SERVER_IP  | awk -F '=' '{print $2}' `
AUTH_TYPE=`cat ./conf/core.conf | grep -w AUTH_TYPE  | awk -F '=' '{print $2}' `


if [ $AUTH_TYPE = 'LDAP' ] ;then
    USERNAME=`cat ./conf/core.conf | grep -w USERNAME  | awk -F '=' '{print $2}' `
    PASSWORD=`cat ./conf/core.conf | grep -w PASSWORD  | awk -F '=' '{print $2}' `
elif [ $AUTH_TYPE = 'KERBEROS' ] ;then
    PRINCIPAL=`cat ./conf/core.conf | grep -w PRINCIPAL  | awk -F '=' '{print $2}' `
    KEYTAB=`cat ./conf/core.conf | grep -w KEYTAB  | awk -F '=' '{print $2}' `
elif  [ $AUTH_TYPE != 'NONE' ] ;then
    echo 'AUTH_TYPE is error,please check core.conf'
    exit
fi 

 

cd ./conf
for i in `ls *.lst`
do
    TABLE_LIST=""
    OWNER=`echo $i | awk -F '.' '{print $1}'`
    echo "set role admin;" >> ${i}.analyze
    ##cat $i | while read j
    for j in `cat $i`
    do
        echo "analyze table ${OWNER}.${j} compute statistics; " >> ${i}.analyze
        ##  echo $j
        TABLE_LIST=${TABLE_LIST}",'"${j}"'"
        ##echo $TABLE_LIST
        ##>> ${i}_analyze
    done
    echo $TABLE_LIST  | sed 's/^,//g'
    ##  beeline -u jdbc:hive2://${SERVER_IP}:10000 -n ${USERNAME} -p ${PASSWORD} -f ${i}.analyze
    cp query.sql ${i}.query
    
done
rm -rf *.analyze





