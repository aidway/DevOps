
#! /bash /sh
IP='11.1.110.2'

if [ $# -eq 0 ]; then
 DATE=`date -d "-1 day" +%Y-%m-%d`
 DATE1=`date -d "-1 day" +%Y%m%d`
 echo $DATE,$DATE1
else
 DATE=`date -d "$1" +%Y-%m-%d`
 DATE1=$1
 echo $DATE,$DATE1
fi

mkdir /root/tdhsoft/scripts/proctime/csv$DATE

#ods 时间统计
beeline  --outputformat=csv --showHeader=true --verbose=false --silent=true -u  jdbc:hive2://$IP:10000/default -n hive -p Bigdata369 -e "SELECT t1.job_name, t1.start_time, t2.end_time FROM (SELECT job_name, max(job_starttime) start_time FROM etl.etl_job_log WHERE etl_date = '$DATE' AND step_num = '1' GROUP BY job_name, step_num) t1 LEFT JOIN (SELECT job_name, max(job_endtime) end_time FROM etl.etl_job_log WHERE etl_date = '$DATE' GROUP BY job_name) t2 ON t1.job_name = t2.job_name;" > /root/tdhsoft/scripts/proctime/csv$DATE/ods$DATE.csv

#pma 绩效统计
beeline  --outputformat=csv --showHeader=true --verbose=false --silent=true -u  jdbc:hive2://$IP:10000/default -n hive -p Bigdata369 -e "select proc_name,min(start_time) start_time , min(end_time) end_time from pma.pma_p_sm_etl_log where etl_date ='$DATE1' group by PROC_NAME  order by start_time asc ; " >/root/tdhsoft/scripts/proctime/csv$DATE/pma$DATE.csv

#crm 客户关系管理
beeline  --outputformat=csv --showHeader=true --verbose=false --silent=true -u  jdbc:hive2://$IP:10000/default -n hive -p Bigdata369 -e "select job_name,min(job_starttime) job_starttime,max(job_endtime) job_endtime from crm.etl_job_log where etl_date = '$DATE' group by job_name  order by job_starttime asc;" > /root/tdhsoft/scripts/proctime/csv$DATE/crm$DATE.csv

#mas 管理会计
beeline  --outputformat=csv --showHeader=true --verbose=false --silent=true -u  jdbc:hive2://$IP:10000/default -n hive -p Bigdata369 -e "select proc_name, FROM_UNIXTIME(min(TO_UNIX_TIMESTAMP(start_time))) start_time,FROM_UNIXTIME(min(TO_UNIX_TIMESTAMP(end_time))) end_time  from mas.etl_log_detail  where data_date='$DATE' group by proc_name order by start_time asc ; " > /root/tdhsoft/scripts/proctime/csv$DATE/mas$DATE.csv

