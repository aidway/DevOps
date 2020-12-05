-- 手工切归档
alter system archive log all;


1）通过alert.log中 最早一条报错信息，和session等待事件确认归档问题；
2）确认归档空间问题足够 ；
3）使用 "alter system archive log all ; " 命令快速恢复系统运行，并验证归档空间可用；
4）调整 log_archive_max_processes 参数，增加归档进程数；
5）kill 存在问题的旧归档进程；


-- 查看最后一次归档时间
set pagesize 999 linesize 120
col last_arch_time for a20 
select thread# instance_id,
       to_char(max(completion_time), 'yyyymmdd hh24:mi:ss') last_arch_time
  from v$archived_log
 group by thread#
 order by instance_id;

 
-- 查看无法归档时长
set pagesize 999 linesize 120
col log_seq for a12 
select p.thread# || '.' || p.group# || '.' || p.sequence# log_seq,
       round(86400 * (sysdate - n.first_time)) noarch_seconds
  from v$log p, v$log n
 where p.sequence# = n.sequence# - 1
   and p.archived = 'NO'
   and p.thread# = n.thread#;

-- 查询每天的归档数量
select to_char(s.FIRST_TIME, 'yyyyMMdd') arch_date, count(*)
  from v$archived_log s
 group by to_char(s.FIRST_TIME, 'yyyyMMdd')
 order by to_char(s.FIRST_TIME, 'yyyyMMdd');


-- 检查spfile中是否存在sid不同的重复参数
col sid for a10
col name for a40
col value for a20
select s.sid,s.name,s.value from v$spparameter s;