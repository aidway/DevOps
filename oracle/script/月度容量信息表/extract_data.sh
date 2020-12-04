#!/bin/sh

##########################################
####
#### extract data from TOPA
####
##########################################


#### topa connection variables
sIp=10.1.37.169
sPort=1521 
sServiceName=TOPA_TAF
sUser=topa_ex
sPassword=oracle

dFileDir=/arch/monthly_report


## check dFileDir directory
if ! [ -d $dFileDir ];then
    echo 'The directory `echo $sFileDir ` does not exist,please check.'
    exit
fi

cd $dFileDir
export NLS_LANG=AMERICAN_CHINA.UTF8  
sqlplus -S $sUser/$sPassword@$sIp:$sPort/$sServiceName <<EOF
set pagesize 1000 feedback off heading off linesize 300 trimspool on
col db_name for a10
col capa_name for a30
spool p_monthly_cap.tmp
select trim(s.db_name || ',' || s.capa_name || ',' || s.smonth || ',' ||
       s.avg_value || ',' || s.avg_lrratio || ',' || s.max_value || ',' ||
       s.max_lrratio) result
  from p_monthly_cap s
 where s.smonth = to_char(add_months(trunc(sysdate), -1), 'yyyy-MM');
spool off
spool p_monthly_space.tmp
select trim(s.db_name || ',' || s.db_id || ',' || s.db_role || ',' ||
       s.tablespace_name || ',' || s.month_name || ',' || s.check_time || ',' ||
       s.tbs_size_mb || ',' || s.free_size_mb || ',' || s.month_inc_mb || ',' ||
       s.used_pct || ',' || s.checkcnt || ',' || s.em2f || ',' || s.em2w) result
  from p_monthly_space s
 where s.month_name = to_char(add_months(trunc(sysdate), -1), 'yyyyMM');
spool off
EOF

cat p_monthly_cap.tmp | grep -v ^$ > p_monthly_cap.dat
cat p_monthly_space.tmp | grep -v ^$ > p_monthly_space.dat
rm -rf p_monthly_cap.tmp
rm -rf p_monthly_space.tmp
