set pagesize 999
set linesize 131
col state for a10
col username for a15
col event for a20
col program for a20
col sql_text for a30
col p1to3 for a10
set feed 1
alter session set nls_date_format='yyyymmdd hh24:mi:ss';

-- 活跃的锁
select s.sid,
       s.username,
       status,
       s.program,
       s.last_call_et,
       s.event,
       s.wait_time,
       s.seconds_in_wait wait_sec,
       s.sql_id
  from v$session s, v$process p
 where s.type = 'USER'
   and p.addr = s.paddr
   and s.status = 'ACTIVE'
 order by s.last_call_et;
 
 
 
-- 持有锁时长
select /*+ rule */
 'LOCK_SID:' || t1.sid || '  Address of lock:' || t1.KADDR, t1.ctime
  from v$lock t1, v$session t2, SYS.OBJ$ t3
 where lmode > 0
   and (t2.PROGRAM not like '%(DW%)' or t2.PROGRAM is null)
   and t3.OBJ# = t1.ID1
   and t1.type = 'TM'
   and t1.sid = t2.sid;


select  a.sid "Lock_sid", a.KADDR "Address of lock",a.CTIME
  from v$lock a, v$session b, dba_objects c
 where a.type = 'TM'
   and a.lmode > 0
   and a.SID=b.SID
   and a.ID1=c.OBJECT_ID
   and (b.PROGRAM not like '%(DW%)' or b.PROGRAM is null);
   
   
   
-- 锁排队信息
set pagesize 999 linesize 120
col lock_info for a60 
select 'LOCKED_OBJ:' || decode(CHR(bitand(b.p1, -16777216) / 16777215) ||
                               CHR(bitand(b.p1, 16711680) / 65535),
                               'TX',
                               nvl(c.name, 'Not Table'),
                               'TM',
                               c.name,
                               'Not Obj Lock') || ',LOCK_TYPE:' ||
       CHR(bitand(b.p1, -16777216) / 16777215) ||
       CHR(bitand(b.p1, 16711680) / 65535) || ',LOCK_TIME:' ||
       max(b.SECONDS_IN_WAIT) || ',LOCK_CNT:' || count(b.sid) lock_info,
       count(b.sid) wait_sessions
  from (select w.p1, w.p2, w.seconds_in_wait, a.sid, a.ROW_WAIT_OBJ#
          from v$session a, v$session_wait w
         where a.sid = w.sid
           and w.event like 'enq%'
           and w.state = 'WAITING') b,
       sys.obj$ c
 where c.obj#(+) = decode(CHR(bitand(b.p1, -16777216) / 16777215) ||
                          CHR(bitand(b.p1, 16711680) / 65535),
                          'TX',
                          b.ROW_WAIT_OBJ#,
                          'TM',
                          b.p2,
                          2)
 group by b.p1, c.name;
 
 
 
set line 200 pages 999
col session_id for 9999
col owner for a10
col object_name for a20
col object_type for a15
col blocked_sid for 9999
col blocking_sid for 9999
col session_status for a17
col sql_id for a15
col sql_text for a20
col last_call_et for 999999999
col event for a20
col program for a20
col lock_type for a10


-- 查询被阻塞的信息
select b.sid              blocked_sid,
       b.blocking_session blocking_sid,
       b.status           session_status,
       a.sql_id,
       a.sql_text,
       b.last_call_et,
       b.event,
       b.program,
       c.type             lock_type
  from v$sqlarea a, v$session b, v$lock c
 where a.sql_id = b.sql_id
   and b.sid = c.sid
   and c.request > 1;

-- 查询阻塞/被阻塞的对象
select a.session_id, owner, object_name, object_type
  from v$locked_object a, dba_objects b
 where a.object_id = b.object_id
 order by session_id;


-- kill阻塞者会话
select 'alter system kill session ' || '''' || a.blocking_session || ',' ||
       b.serial# || '''' || ';' kill_sql
  from v$session a, v$session b
 where a.blocking_session is not null
   and a.blocking_session = b.sid;