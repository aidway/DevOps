��ѯ��־�л�Ƶ�ʣ�ÿСʱ��:
select to_char(first_time,'yyyymmdd hh24')||floor(to_char(first_time,'mi')/30) log_date,count(*) 
from v$archived_log 
group by to_char(first_time,'yyyymmdd hh24')||floor(to_char(first_time,'mi')/30) order by 1;


set pagesize 4000
select to_char(FIRST_TIME,'yyyymmdd hh24')||floor(to_char(FIRST_TIME,'mi')/30)  log_date,count(*) 
from v$log_history 
group by   to_char(FIRST_TIME,'yyyymmdd hh24')||floor(to_char(FIRST_TIME,'mi')/30) 
order by 1;


set pagesize 4000
select to_char(FIRST_TIME,'yyyymmdd hh24'),count(*) 
from v$log_history 
group by   to_char(FIRST_TIME,'yyyymmdd hh24') 
order by 1;


set pagesize 4000
select to_char(FIRST_TIME,'yyyymmdd'),count(*) 
from v$log_history 
group by to_char(FIRST_TIME,'yyyymmdd')
order by 1;


-- ��ѯÿ�����ɵ���־����
select to_char(FIRST_TIME, 'yyyymmdd') log_date,
       count(*) cnt
  from v$log_history
 group by to_char(FIRST_TIME, 'yyyymmdd')  
 order by 1;

select to_char(FIRST_TIME, 'yyyymmdd') log_date,
       count(*) cnt
  from v$archived_log
 group by to_char(FIRST_TIME, 'yyyymmdd')  
 order by 1;

-- һ��ǰÿСʱ��������־
select to_char(first_time, 'yyyymmdd hh24') log_date, count(*)
  from v$archived_log
 where to_char(first_time, 'yyyymmdd') >= to_char(sysdate - 1, 'yyyymmdd')
   --and to_char(first_time, 'hh24') between '02' and '10'
 group by to_char(first_time, 'yyyymmdd hh24')
 order by 1;

-- ÿСʱ�鵵����־��
select to_char(first_time, 'yyyy-mm-dd hh24'), count(*)
  from v$log_history
 where thread# = 1
 group by to_char(first_time, 'yyyy-mm-dd hh24')
 order by to_char(first_time, 'yyyy-mm-dd hh24');




---------------------
�鵵�����϶࣬�����ѯ���¹鵵���sql��
�����ȿ���־�л�Ƶ�ʣ��ҵ��л�Ƶ����ߵ�ʱ��Σ���Ը�ʱ�������awr��