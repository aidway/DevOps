-- 查看使用undo表空间的应用程序
set pagesize 999 linesize 120
col machine for a16
col program for a20
col status for a10
col sql_id for a16
col sql_text for a20 
select distinct s.machine,
                s.program,
                s.sid,
                round(t.used_ublk * 8 / 1024, 2) undo_MB,
                used_urec undo_records,
                s.status,
                l.sql_text
  from v$transaction t, v$session s, v$sqlstats l
 where t.ses_addr = s.saddr
   and s.sql_id = l.sql_id(+)
 order by undo_MB;



--查询undo活跃空间使用率
SELECT round(nvl((b.used_m/a.total_m)*100,0),2) used_percentage 
from 
(select t.tablespace_name tsname,sum(f.bytes)/1024/1024 total_m 
from dba_tablespaces t,dba_data_files f 
where t.tablespace_name=f.tablespace_name 
and t.contents='UNDO' 
group by t.tablespace_name) a, 
(select tablespace_name tsname,sum(bytes)/1024/1024 used_m from dba_undo_extents 
where status in ('ACTIVE') 
group by tablespace_name 
) b 
where 
a.tsname=b.tsname(+);

