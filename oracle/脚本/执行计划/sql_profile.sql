-- 查询sql历史执行信息
select s.snap_id,
       to_char(t.begin_interval_time, 'yyyy-mm-dd hh24:mi:ss') begin_time,
       to_char(t.end_interval_time, 'yyyy-mm-dd hh24:mi:ss') end_time,
       s.sql_id,
       s.plan_hash_value,
       round(s.elapsed_time_delta / s.executions_delta)/1000000 elapsed_time_per
  from dba_hist_sqlstat s, dba_hist_snapshot t
 where s.sql_id = '5sqz3mcggz1p6'
   and s.executions_delta > 0
   and s.snap_id = t.snap_id
 order by s.snap_id desc;

-- 查询缓存的sql执行计划是否有变化
select s.SQL_ID, s.PLAN_HASH_VALUE
  from v$sql s
 where s.SQL_ID = '2amt4cr6d0hk0';







select * from dba_sql_profiles;
exec dbms_sqltune.drop_sql_profile(:pname);
 