#!/bin/sh


# -----------------------------------------------------------------------------------------
#
# Filename:    run.sh
# Version:     1.0
# Date:        2017-1-3
# Author:      kww
# Description: get tdt json
# Notes:       tdt4.7
#
# -----------------------------------------------------------------------------------------



cnt=`cat ./tables | grep -v "^$" | wc -l`
USERNAME=hxsts
PASSWORD=hxsts
OGG_DIR_HDFS=/tdt/log
DBNAME=hxsts


echo "{"                                 > test.json
echo '  "NodeDependency": ['            >> test.json
for (( i=1; i<= $cnt; i++ ))            
do          
    hasDate=`sed -n ''${i}'p' tables | awk -F '=' {'print $2'}`                          
    echo "    {"                        >> test.json
    echo '      "A": "B'$i'"'           >> test.json 
    echo "    },"                       >> test.json
    if [ $hasDate = "Y" ];then
        echo "    {"                        >> test.json
        echo '      "B'$i'":"C'$i'"'        >> test.json
        echo "    },"                       >> test.json
        echo "    {"                         >> test.json
        echo '      "C'$i'":"D'$i'"'         >> test.json
        echo "    },"                        >> test.json
    else
        echo "    {"                        >> test.json
        echo '      "B'$i'":"D'$i'"'        >> test.json
        echo "    },"                       >> test.json
    fi
done
sed -i '$s/,//' test.json
echo "  ],"                             >> test.json
echo '  "NodeDescription": {'           >> test.json
echo '    "A": {'                       >> test.json
echo '      "Operation": "Reader",'     >> test.json
echo '      "Type": "Ogg",'             >> test.json
echo '      "Location": "${OGG_DIR}",'  >> test.json
echo '      "UpdateInOneRow": true,'    >> test.json
echo '      "InputTableNames": ['       >> test.json


cat tables | grep -v "^$" |   while read i;
do
   table_name=`echo $i | awk -F '|' '{print $1}'`
   echo '      "'$table_name'",'        >> test.json
done
sed -i '$s/,//' test.json

echo '     ],'                          >> test.json
echo '     "TableDetails": {'           >> test.json


cat tables | grep -v "^$" |   while read i;
do
     table_name=`echo $i | awk -F '|' '{print $1}'`
     echo '        "'$table_name'":{'          >> test.json
     echo '            "OutputColumnNames": [' >> test.json

cp sql1.sql template.sql
sed  -i "s/XXXXXXX/$table_name/g" ./template.sql
sqlplus -s $USERNAME/$PASSWORD <<EOF >/dev/null 2>&1
set pagesize 9999 feedback off heading off linesize 200 trimspool on
spool ./col_name.txt
@./template.sql
spool off
EOF
sed -i '$s/,$//' col_name.txt
cat col_name.txt | grep -v "^$"                >> test.json
rm -f col_name.txt

     echo '            ],'                     >> test.json
     echo '            "OutputColumnTypes": [' >> test.json


cp sql2.sql template.sql
sed  -i "s/XXXXXXX/$table_name/g" ./template.sql
sqlplus -s $USERNAME/$PASSWORD <<EOF >/dev/null 2>&1
set pagesize 9999 feedback off heading off linesize 200 trimspool on
spool ./col_name.txt
@./template.sql
spool off
EOF
sed -i '$s/,$//' col_name.txt
cat col_name.txt | grep -v "^$" >> test.json
rm -f col_name.txt

     echo '            ]' >> test.json
     echo '        },' >> test.json
done
sed -i '$s/,//' test.json
echo "     } " >> test.json
echo "    }," >> test.json


num=1
cat tables | grep -v "^$" |   while read i;
do
    table_name=`echo $i | awk -F '|' '{print $1}'`
    col_name=`echo $i | awk -F '|' '{print $2}'`
    buckets_num=`echo $i | awk -F '|' '{print $3}'`
    col_type=`echo $i | awk -F '|' '{print $4}'`
    uniq_col_name=`echo $i | awk -F '|' '{print $5}'`
    uniq_col_type=`echo $i | awk -F '|' '{print $6}'`
    hasDate=`sed -n ''${num}'p' tables | awk -F '=' {'print $2'}` 

    rm -f  uniq_col.tmp
    echo $uniq_col_name | awk -F ',' '{ i=1;while(i<=NF) {print $i;i++}}' | while read j
    do
        echo '          "'$j'",' >> uniq_col.tmp
    done
    sed -i '$s/.$//' uniq_col.tmp    
    
    rm -f  uniq_type.tmp
    echo $uniq_col_type | awk -F ',' '{ i=1;while(i<=NF) {print $i;i++}}' | while read j
    do
        echo '          "'$j'",' >> uniq_type.tmp
    done
    sed -i '$s/.$//' uniq_type.tmp    
    
    echo '    "B'$num'": {' >> test.json
    echo '        "Operation": "Transformer",' >> test.json
    echo '        "Type": "TableFilter",' >> test.json
    echo '        "SelectedTableName": "'$table_name'"' >> test.json
    echo '    },' >> test.json
    
    if [ $hasDate = "Y" ];then
        echo '    "C'$num'": { '                       >> test.json
        echo '           "Operation": "Transformer",'      >> test.json
        echo '           "Type": "ColumnMap",'             >> test.json
        echo '           "OutputColumnExpressions": ['     >> test.json
        echo '              "TDA_TABLE",'                     >> test.json
        echo '              "TDA_OP",'                        >> test.json
        echo '              "TDA_ID" ,'                       >> test.json
        echo '              "TDA_USER",'                      >> test.json
        echo '              "TDA_TIME",'                      >> test.json
        echo '              "TDA_BA",'                        >> test.json
        cp sql3.sql template.sql
        sed  -i "s/XXXXXXX/$table_name/g" ./template.sql
sqlplus -s $USERNAME/$PASSWORD <<EOF >/dev/null 2>&1
set pagesize 9999 feedback off heading off linesize 200 trimspool on
spool ./col_name.txt
@./template.sql
spool off
EOF
        sed -i '$s/,$//' col_name.txt
        cat col_name.txt | grep -v "^$" >> test.json
        rm -f col_name.txt
        echo '            ],                                 ' >> test.json
        echo '            "OutputColumnTypes": [       ' >> test.json
        echo '              "string",                  ' >> test.json
        echo '              "string",                  ' >> test.json
        echo '              "decimal(32,0)",           ' >> test.json
        echo '              "string",                  ' >> test.json
        echo '              "string",                  ' >> test.json
        echo '              "string",                  ' >> test.json
        cp sql4.sql template.sql
        sed  -i "s/XXXXXXX/$table_name/g" ./template.sql
        sqlplus -s $USERNAME/$PASSWORD <<EOF >/dev/null 2>&1
set pagesize 9999 feedback off heading off linesize 200 trimspool on
spool ./col_type.txt
@./template.sql
spool off
EOF
        sed -i '$s/,$//' col_type.txt
        cat col_type.txt | grep -v "^$" >> test.json
        rm -f col_type.txt
        echo '          ],                                 ' >> test.json
        echo '          "OutputColumnNames": [       ' >> test.json
        echo '              "TDA_TABLE",               ' >> test.json
        echo '              "TDA_OP",                  ' >> test.json
        echo '              "TDA_ID" ,                 ' >> test.json
        echo '              "TDA_USER",                ' >> test.json
        echo '              "TDA_TIME",                ' >> test.json
        echo '              "TDA_BA",                  ' >> test.json
        cp sql1.sql template.sql
        sed  -i "s/XXXXXXX/$table_name/g" ./template.sql
sqlplus -s $USERNAME/$PASSWORD <<EOF >/dev/null 2>&1
set pagesize 9999 feedback off heading off linesize 200 trimspool on
spool ./col_name.txt
@./template.sql
spool off
EOF
        sed -i '$s/,$//' col_name.txt
        cat col_name.txt | grep -v "^$" >> test.json
        rm -f col_name.txt
        echo '             ] ' >> test.json
        echo '           },' >> test.json
    fi

    echo '    "D'$num'": {'                             >> test.json
    echo '        "Operation": "Writer",'               >> test.json
    echo '        "Type": "ORCTransactionSync",'        >> test.json
    echo '        "DatabaseName": "'$DBNAME'",'         >> test.json
    echo '        "TableName": "'$table_name'",'        >> test.json
    echo '        "BucketNumber": '$buckets_num','      >> test.json
    echo '        "ClusterKey": "'$col_name'",'         >> test.json
    echo '        "PartitionColumnNames": [],'          >> test.json
    echo '        "PartitionColumnTypes": [],'          >> test.json
    echo '        "SortKeys": [],'                      >> test.json
    echo '        "SortAscDirections": [], '            >> test.json
    echo '        "UniqueIdentifyKeys": ['              >> test.json
    
    cat  uniq_col.tmp                                   >> test.json
 
    echo '        ],'                                   >> test.json
    echo '        "UniqueIdentifyKeyTypes": ['          >> test.json
    
    cat  uniq_type.tmp                                  >> test.json
    
    echo '        ],'                                   >> test.json
    echo '        "TransactionPerJob": false,'          >> test.json
    echo '        "CreateIfNotExists": true,'           >> test.json
    echo '        "TruncateTable": false,'              >> test.json
    echo '        "AllowDuplicateData": false'          >> test.json
    echo '      },'                                     >> test.json

    ((num++))
done
sed -i '$s/,//' test.json

echo '  },'                              >> test.json
echo '  "Parameters": {'               >> test.json
echo '    "OGG_DIR": "'$OGG_DIR_HDFS'"'   >> test.json
echo '  }'                             >> test.json
echo '}'                               >> test.json

rm template.sql
mv test.json hxsts.json
rm -f uniq*.tmp
