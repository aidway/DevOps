#!/bin/sh


INCEPTOR_SERVER=$1
USERNAME=$2
PASSWORD=$3
DATABASE_NAME=$4


sed  "s/XXXXXXX/$DATABASE_NAME/g" ./sql/getTabInfo_day.sql > ./sql/getTabInfo_day.sql.${DATABASE_NAME}
sed  "s/XXXXXXX/$DATABASE_NAME/g" ./sql/getTabInfo_month.sql > ./sql/getTabInfo_month.sql.${DATABASE_NAME}
sed  "s/XXXXXXX/$DATABASE_NAME/g" ./sql/getTabInfo_year.sql > ./sql/getTabInfo_year.sql.${DATABASE_NAME}
sed  "s/XXXXXXX/$DATABASE_NAME/g" ./sql/getTabInfo_wrong.sql > ./sql/getTabInfo_wrong.sql.${DATABASE_NAME}


beeline --outputformat=csv --showHeader=false --verbose=false --silent=true -u jdbc:hive2://${INCEPTOR_SERVER}:10000 -n $USERNAME -p $PASSWORD -f ./sql/getTabInfo_day.sql.${DATABASE_NAME} > ./table_info/${DATABASE_NAME}_day.info
beeline --outputformat=csv --showHeader=false --verbose=false --silent=true -u jdbc:hive2://${INCEPTOR_SERVER}:10000 -n $USERNAME -p $PASSWORD -f ./sql/getTabInfo_month.sql.${DATABASE_NAME} > ./table_info/${DATABASE_NAME}_month.info
beeline --outputformat=csv --showHeader=false --verbose=false --silent=true -u jdbc:hive2://${INCEPTOR_SERVER}:10000 -n $USERNAME -p $PASSWORD -f ./sql/getTabInfo_year.sql.${DATABASE_NAME} > ./table_info/${DATABASE_NAME}_year.info
beeline --outputformat=csv --showHeader=false --verbose=false --silent=true -u jdbc:hive2://${INCEPTOR_SERVER}:10000 -n $USERNAME -p $PASSWORD -f ./sql/getTabInfo_wrong.sql.${DATABASE_NAME} > ./table_info/${DATABASE_NAME}_wrong.info


sed -i 's/"//g' ./table_info/${DATABASE_NAME}_day.info
sed -i 's/"//g' ./table_info/${DATABASE_NAME}_month.info
sed -i 's/"//g' ./table_info/${DATABASE_NAME}_year.info
sed -i 's/"//g' ./table_info/${DATABASE_NAME}_wrong.info

# day partition
cat ./table_info/${DATABASE_NAME}_day.info | while read i
do
    table_name=`echo $i | awk -F ',' '{print $1}'`
    partition_name=`echo $i | awk -F ',' '{print $2}'`
    max_begin=`echo $i | awk -F ',' '{print $3}'`
    max_end=`echo $i | awk -F ',' '{print $4}'`
    range_diff=`echo $i | awk -F ',' '{print $5}'`
    currdate=`echo $i | awk -F ',' '{print $6}'`
    leftdays=`echo $i | awk -F ',' '{print $7}'`
    left_parts=`echo $i | awk -F ',' '{print $8 }'`
    expand_parts=`echo $i | awk -F ',' '{print $9 }'`
    
    start_date_b=$max_end
    #start_date_b='20000101'
    for ((i=1; i<=$expand_parts;i++))
    do
        start_date_a=`date -d "$start_date_b 1 days" +"%Y%m%d"`  
        echo "alter table ${DATABASE_NAME}.$table_name add partition p_${start_date_b} values less than ('$start_date_a');" >> ./alter_script/${DATABASE_NAME}_day.sql
        start_date_b=$start_date_a
    done
done

# month partition
cat ./table_info/${DATABASE_NAME}_month.info | while read i
do
    table_name=`echo $i | awk -F ',' '{print $1}'`
    max_end=`echo $i | awk -F ',' '{print $4}'`
    expand_parts=`echo $i | awk -F ',' '{print $9 }'`

    start_date_b=$max_end
    for ((i=1; i<=$expand_parts;i++))
    do
        start_date_a=`date -d "$start_date_b 1 month" +"%Y%m%d"`  
        echo "alter table ${DATABASE_NAME}.$table_name add partition p_${start_date_b:0:6} values less than ('$start_date_a');" >> ./alter_script/${DATABASE_NAME}_month.sql
        start_date_b=$start_date_a
    done
done


# year partition
cat ./table_info/${DATABASE_NAME}_year.info | while read i
do
    table_name=`echo $i | awk -F ',' '{print $1}'`
    max_end=`echo $i | awk -F ',' '{print $4}'`
    expand_parts=`echo $i | awk -F ',' '{print $9 }'`

    start_date_b=$max_end
    for ((i=1; i<=$expand_parts;i++))
    do
        start_date_a=`date -d "$start_date_b 1 year" +"%Y%m%d"`  
        echo "alter table ${DATABASE_NAME}.$table_name add partition p_${start_date_b:0:4} values less than ('$start_date_a');" >> ./alter_script/${DATABASE_NAME}_year.sql
        start_date_b=$start_date_a
    done
done

