#!/bin/sh
INCEPTOR_SERVER=11.1.199.6
DBNAME=system
USERNAME=hive
PASSWORD=Bigdata1234
DDLDIR=/root/tdhsoft/scripts/tdhorc/sql

rm -rf ./procedure
mkdir ./procedure

beeline --outputformat=csv --showHeader=false --verbose=false --silent=true -u  jdbc:hive2://$INCEPTOR_SERVER:10000/$DBNAME -n $USERNAME -p $PASSWORD -e "SELECT s.procedure_name FROM system.procedures_v s WHERE s.database_name='mas';" > procedure.list

sed -i 's/"//g' procedure.list

for i in `cat ./procedure.list`
do    
    beeline --outputformat=csv --showHeader=false --verbose=false --silent=true -u  jdbc:hive2://$INCEPTOR_SERVER:10000/$DBNAME -n $USERNAME -p $PASSWORD -e "SELECT s.full_text FROM system.procedures_v s WHERE s.database_name='mas' AND s.procedure_name='$i';" > ./procedure/$i.sql
    sed -i 's/^"//g' ./procedure/$i.sql
    sed -i 's/"$//g' ./procedure/$i.sql
    sed -i '1i !set plsqlUseSlash true ' ./procedure/$i.sql
    echo "/" >> ./procedure/$i.sql
done

rm -f procedure.list
