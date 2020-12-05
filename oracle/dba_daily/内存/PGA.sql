_PGA_MAX_SIZE  200MB  每个进程所能分配的最大PGA内存。


-- 查询会话使用的pga情况
select sum(value)/1024/1024 size_mb
  from v$sesstat s,v$statname n
where n.statistic#=s.statistic#
  and name = 'session pga memory';


-- 查询消耗PGA的操作
col name for a30
select sid,name,value
  from v$statname n,v$sesstat s
 where n.statistic#=s.statistic#
   and name like 'session%memory%'
 order by 3 asc; 


-- PGA分配情况
col c1 heading 'Program|Name'         format a30
col c2 heading 'PGA|Used|Memory'      format 999,999,999
col c3 heading 'PGA|Allocated|Memory' format 999,999,999
col c4 heading 'PGA|Maximum|Memory'   format 999,999,999
col username forma a10
select a.program       c1,
       a.username,
       b.pga_used_mem  c2,
       b.pga_alloc_mem c3,
       b.pga_max_mem   c4
  from v$session a, v$process b
 where a.paddr = b.addr
 order by c4 desc;


-- 查询pga组件大小
select * from v$pgastat;


 