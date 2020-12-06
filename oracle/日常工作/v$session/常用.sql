-- 查询当前连接数据库的应用用户
set line 200 pages 999
col program for a40
set line 200 pages 999
col username for a20
col wait_class for a20
select sid, serial#, username, status, program, sql_id, wait_class
  from v$session a
 where type = 'USER'
   and status = 'ACTIVE'
 order by wait_class;


-- 查询当前session正在执行的sql
set line 200 pages 999
col sid for 99999
col sql_id for a15
col sql_hash_value for 999999999999999
col sql_text for a30
col LAST_CALL_ET for a15
select sid,s.sql_id,s.sql_hash_value,t.sql_text,s.LAST_CALL_ET seconds,event
  from v$session s, v$sqlstats t
 where s.type = 'USER'
   and s.sql_id is not null
   and s.sql_id = t.sql_id(+)
   and s.status = 'ACTIVE';


-- 查询os进程正在执行的sql
set line 200 pages 999
col sql_id for a20
col sql_text for a100
select c.sql_id,c.plan_hash_value,to_char(substr(sql_fulltext,1,4000))
  from v$process a, v$session b, v$sql c
 where a.ADDR = b.PADDR
   and b.SQL_ID = c.SQL_ID
   and a.spid = '17194';




-- 查询开销较大的sql
select l.sid ssid,
       substr(opname, 1, 15) opanme,
       target,
       trunc((sofar / totalwork) * 100) pct,
       to_char(60 * l.sofar * 8192 /
               (24 * 60 * (l.last_update_time - l.start_time)) / 1024 / 1024 / 60,
               '0000.0') rate,
       l.elapsed_seconds / 60 es,
       l.time_remaining / 60 tr,
       s.program,
       s.machine
  from v$session_longops l, v$session s
 where l.time_remaining > 0
   and l.sid = s.sid
 order by start_time;



-- 查询当前已连接数据库的用户
set line 200
col sid for 99999
col serial# for 999999
col username for a10
col status for a10
col machine for a10
col program for a15
col type for a8
col sql_id for a15
col event for a20
col state for a20
select s.SID,
       s.SERIAL#,
       s.USERNAME,
       s.STATUS,
       s.MACHINE,
       s.PROGRAM,
       s.TYPE,
       s.SQL_ID,
       s.LOGON_TIME,
       s.EVENT,
       s.STATE
  from v$session s
 where s.USERNAME is not null;

