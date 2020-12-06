select * from v$sort_segment s ;

-- ��ѯ��ʱ�ε�ʹ�����
select * from v$tempseg_usage s;
v$sort_usage

-- ��ѯ����temp��صȴ��¼���sql
select to_char(s.sample_time, 'yyyy-mm-dd hh24:mi:ss'),
       s.session_id,
       s.session_serial#,
       s.sql_id,
       s.sql_plan_hash_value,
       s.event,
       s.delta_write_io_bytes,
       s.delta_read_io_bytes
  from v$active_session_history s
 where s.event like '%temp%';


-- ��ѯ����ִ�е�ռ��temp��ռ��sql
select sid, schemaname, sql_id
  from v$session
 where status = 'ACTIVE'
   and type = 'USER'
   and event like '%temp%';


 
-- �鿴ʹ����ʱ��ռ��Ӧ�ó���
set pagesize 999 linesize 200
col username for a16
col program for a20
col segtype for a10
col sql_id for a16
col sql_text for a20 
select s.username,
       s.program,
       s.sid,s.serial#,
       u.segtype,
       round(u.blocks * 8 / 1024) size_mb,
       s.sql_id,
       s.last_call_et run_sec,
       l.sql_text
  from v$sort_usage u, v$session s, v$sqlstats l
 where u.session_addr = s.saddr
   and u.blocks > 1024
   and s.sql_id = l.sql_id(+)
 order by 5 desc;



-- ����
alter database tempfile '/dev/vgdb/rlvtemp' resize 8000M;

-- ���
select a.tablespace_name,
       b.file_name,
       a.block_size,
       a.block_size,
       b.bytes / 1024 / 1024 mb,
       b.STATUS
  from dba_tablespaces a, dba_temp_files b
 where a.tablespace_name = b.tablespace_name;


-- ����ɱ���̵����
select 'ALTER SYSTEM KILL SESSION ''' || SID || ',' || SERIAL# || ''';'
  FROM V$SESSION
 WHERE (SERIAL#, SADDR) in
       (select SESSION_NUM, SESSION_ADDR from v$sort_usage);