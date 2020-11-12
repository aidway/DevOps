#!/bin/sh


# -----------------------------------------------------------------------------------------
#
# Filename:    run.sh
# Version:     1.0
# Date:        2017-08-10
# Author:      kww
# Description: Export tdh orc ddl
# OS Type:     linux
#
# -----------------------------------------------------------------------------------------

SERVER_IP=11.1.205.33
USERNAME=hive
PASSWORD=tdh123%
DBNAME=crm


rm -rf ./getOrcDdl.sql
cp ./template.sql ./template.sql.bak
sed -i "s/YYYYYYY/$DBNAME/g" ./template.sql
for i in ` cat ./tables.lst  `
do
    table_name=`echo $i `
    sed  "s/XXXXXXX/$table_name/g" ./template.sql >> ./getOrcDdl.sql
    echo "" >>  ./getOrcDdl.sql
done

mv ./template.sql.bak ./template.sql

beeline  --showHeader=false --verbose=false --silent=true --maxWidth=10000 -u jdbc:hive2://${SERVER_IP}:10000 -n $USERNAME -p $PASSWORD -f ./getOrcDdl.sql > orcddl.sql

sed -i 's/|//g' orcddl.sql
sed -i '/^+/d' orcddl.sql