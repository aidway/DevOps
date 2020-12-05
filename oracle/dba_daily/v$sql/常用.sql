-- 查询sql执行历史，对比不同执行计划的执行时间
select snap_id,
       sql_id,
       plan_hash_value,
       round(elapsed_time_delta / executions_delta) elapsed_time_per
  from dba_hist_sqlstat
 where sql_id = '4vak44m1h6f9t'
   and executions_delta > 0
 order by snap_id desc;