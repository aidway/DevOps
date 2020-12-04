#!/bin/sh

rm -f ./sqoop.sh
for i in ` cat tables `
do
    sed  "s/XXXXXXX/$i/g" template >> ./sqoop.sh
    echo ""                        >> ./sqoop.sh
done

chmod u+x ./sqoop.sh
