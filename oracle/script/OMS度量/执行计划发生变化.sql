--查询执行计划发生变化，且执行时间发生变化超过5倍以上的语句。
set linesize 200
set pagesize 20000
select c.sql_id          c_sql_id,
       c.snap_id         c_snap_id,
       d.sql_id          d_sql_id,
       d.snap_id         d_snap_id,
       c.plan_hash_value,
       d.plan_hash_value,
       c.elapsed_time    c_time,
       d.elapsed_time    d_time
  from (select rownum as num, a.*
          from (select sql_id,
                       snap_id,
                       PLAN_HASH_VALUE,
                       ceil(ELAPSED_TIME_DELTA /
                            decode(EXECUTIONS_DELTA, 0, 1, EXECUTIONS_DELTA)) as elapsed_time
                  from dba_hist_sqlstat
                 where ELAPSED_TIME_DELTA > 0
                   and PARSING_SCHEMA_NAME = 'CBS'
                 order by sql_id, snap_id) a) c,
       (select rownum as num, b.*
          from (select sql_id,
                       snap_id,
                       PLAN_HASH_VALUE,
                       ceil(ELAPSED_TIME_DELTA /
                            decode(EXECUTIONS_DELTA, 0, 1, EXECUTIONS_DELTA)) as elapsed_time
                  from dba_hist_sqlstat
                 where ELAPSED_TIME_DELTA > 0
                   and PARSING_SCHEMA_NAME = 'BSMA'
                 order by sql_id, snap_id) b) d,
       dba_hist_snapshot s
 where c.num + 1 = d.num
   and c.sql_id = d.sql_id
   --and c.sql_id = '91ww6c7bnt33j'
   and c.plan_hash_value <> d.plan_hash_value
   and d.snap_id = s.snap_id
   and s.END_INTERVAL_TIME > systimestamp - 1
   and d.elapsed_time / decode(c.elapsed_time, 0, 1, c.elapsed_time) >= 5;

--查询sql语句执行计划，执行时间情况。
select rownum as num, a.*
  from (select sql_id,
               snap_id,
               PLAN_HASH_VALUE,
               ceil(ELAPSED_TIME_DELTA /
                    decode(EXECUTIONS_DELTA, 0, 1, EXECUTIONS_DELTA)) as elapsed_time,
               EXECUTIONS_DELTA
          from dba_hist_sqlstat
         where sql_id = '1qt0832v92a6r'
         order by sql_id, snap_id) a;

--查询sql语句，执行时间分布情况
set linesize 200
select snap_id,
       plan_hash_value,
       BUFFER_GETS_DELTA / executions_delta gets,
       CPU_TIME_DELTA / executions_delta cpu,
       ELAPSED_TIME_DELTA / executions_delta elapse_time,
       IOWAIT_DELTA / executions_delta iowait,
       CLWAIT_DELTA / executions_delta clwait,
       APWAIT_DELTA / executions_delta apwait,
       CCWAIT_DELTA / executions_delta ccwait,
       PHYSICAL_READ_BYTES_DELTA / executions_delta physical_read_bytes,
       executions_delta executions_delta
  from dba_hist_sqlstat
 where snap_id in (69121, 69125)
   and sql_id = '1qt0832v92a6r';

--查询执行计划发生变化，且执行时间发生变化超过5倍以上的distinct sql_id。
set linesize 200
set pagesize 20000
select distinct c.sql_id
  from (select rownum as num, a.*
          from (select sql_id,
                       snap_id,
                       PLAN_HASH_VALUE,
                       ceil(ELAPSED_TIME_DELTA /
                            decode(EXECUTIONS_DELTA, 0, 1, EXECUTIONS_DELTA)) as elapsed_time
                  from dba_hist_sqlstat
                 where ELAPSED_TIME_DELTA > 0
                   and PARSING_SCHEMA_NAME = 'CBS'
                 order by sql_id, snap_id) a) c,
       (select rownum as num, b.*
          from (select sql_id,
                       snap_id,
                       PLAN_HASH_VALUE,
                       ceil(ELAPSED_TIME_DELTA /
                            decode(EXECUTIONS_DELTA, 0, 1, EXECUTIONS_DELTA)) as elapsed_time
                  from dba_hist_sqlstat
                 where ELAPSED_TIME_DELTA > 0
                   and PARSING_SCHEMA_NAME = 'CBS'
                 order by sql_id, snap_id) b) d,
       dba_hist_snapshot s
 where c.num + 1 = d.num
   and c.sql_id = d.sql_id
   and c.plan_hash_value <> d.plan_hash_value
   and d.snap_id = s.snap_id
   and s.END_INTERVAL_TIME > systimestamp - 1
   and d.elapsed_time / decode(c.elapsed_time, 0, 1, c.elapsed_time) >= 5;

