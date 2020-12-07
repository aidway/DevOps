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



-- 查询会话的等待事件
select *
  from (select sid, event, p1, p2, p3, p1text, WAIT_TIME, SECONDS_IN_WAIT
          from v$session_wait
         where wait_class# <> 6
         order by wait_time desc)
 where rownum <= 10;



-- 查询所有等待事件占db time的比值
set line 200 pages 999
col EVENT for a30
col WAIT_CLASS for a20
col TIME_WAITED_MICRO for 999999999999999
col PCT_DB_TIME for 9999
SELECT EVENT,
       e.WAIT_CLASS,
       TIME_WAITED_MICRO,
       ROUND(TIME_WAITED_MICRO * 100 / S.DBTIME, 1) PCT_DB_TIME
  FROM V$SYSTEM_EVENT E,
       V$EVENT_NAME N,
       (SELECT VALUE DBTIME
          FROM V$SYS_TIME_MODEL
         WHERE STAT_NAME = 'DB time') S
 WHERE E.EVENT_ID = N.EVENT_ID
   AND N.WAIT_CLASS NOT IN ('Idle', 'System I/O')
 ORDER BY PCT_DB_TIME ASC;