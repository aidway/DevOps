
#!/bin/sh
INCEPTOR_SERVER=11.1.199.2
DBNAME=mas
USERNAME=mas
PASSWORD=123456
DDLDIR=/root/tdhsoft/scripts/tdhorc/procedure

for i in `ls $DDLDIR`
do
    echo $i
    beeline --outputformat=csv --showHeader=false --verbose=false --silent=true -u  jdbc:hive2://$INCEPTOR_SERVER:10000/$DBNAME -n $USERNAME -p $PASSWORD -f $DDLDIR/$i
done
