-- 改一下，通过sql_id查询event
select sql_id,count(*) from v$active_session_history 
where event='enq: TX - row lock contention' 
and sample_time>to_date('20150407 12:00','yyyymmdd hh24:mi') 
and sample_time<to_date('20150407 15:30','yyyymmdd hh24:mi') 
group by sql_id
order by 2;


select sql_id,count(*) 
from SYS.WRH$_ACTIVE_SESSION_HISTORY 
where event_id=(select event_id from v$event_name where name='db file scattered read')
and sample_time>to_date('20150211 18:00','yyyymmdd hh24:mi') 
and sample_time<to_date('20150211 19:00','yyyymmdd hh24:mi')  
group by sql_id order by 2;
