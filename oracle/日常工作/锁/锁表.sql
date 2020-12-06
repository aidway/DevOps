select *
  from v$lock
 where request <> 0
    or LMODE = 6
   and type = 'TX';
 
set line 200
col owner for a10
col object_name for a15
col object_type for a10
col session_id 999
col serial# 999
col status for a10 
col kill_sql for a40 
col module for a10
col machine for a10
col TERMINAL for a10
col OS_USER_NAME for a10
col PROGRAM for a10
select a.owner,
       a.object_name,
       a.object_type,
       b.SESSION_ID,
       c.SERIAL#,
       c.STATUS,
       c.MACHINE,
       c.TERMINAL,
       c.PROGRAM,
       b.OS_USER_NAME,
       c.TYPE,
       c.MODULE,
       c.SQL_ID,
       c.PREV_SQL_ID,
       'alter system kill session ' || '''' || c.sid || ',' || c.SERIAL# || '''' || ';' kill_sql
  from dba_objects a, v$locked_object b, v$session c, v$sql d
 where a.object_id = b.OBJECT_ID
   and b.SESSION_ID = c.SID
   and c.sql_id = d.SQL_ID(+);
