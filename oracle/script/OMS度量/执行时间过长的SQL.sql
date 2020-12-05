-- 度量监控语句：监控执行时间超过1小时的sql
select distinct 'sid:' || s.sid || '; sql_id:' || s.sql_id || '; sql_text:' ||
                substr(to_char(t.sql_text), 1, 120) || '; event:' ||
                s.event || '; username:' || s.username || '; machine:' ||
                s.machine || '; program:' || s.program || '; state:' ||
                state info,
                s.LAST_CALL_ET seconds
  from v$session s, v$sqlstats t
 where s.type = 'USER'
   and s.sql_id is not null
   and s.sql_id = t.sql_id(+)
   and s.status = 'ACTIVE'
   and to_char(sysdate, 'hh24') between '07' and '18';


 
select s.sid,
       s.status,
       s.sql_id,
       substr(to_char(t.sql_text), 1, 180) sql_text,
       s.event,
       sql_exec_start,
       s.LAST_CALL_ET seconds
  from v$session s, dba_hist_sqltext t
 where s.type = 'USER'
   and s.sql_id is not null
   and s.sql_id = t.sql_id
   and s.status = 'ACTIVE';

