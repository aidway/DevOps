###############  目的  ###############
监控执行时间突增的sql，延迟时间为5分钟。




###############  步骤  ###############
1.确定要监控的sql，可由dba和项目组共同确定


2.确定sql执行时间的基线:八天内的最短执行时间
select a.sql_id,
       a.parsing_schema_name,
       min(round(a.elapsed_time_delta / a.executions_delta)) elapsed_time_base
  from dba_hist_sqlstat a, dba_hist_snapshot b
 where a.sql_id in ('4byghth7kppad')
   and a.snap_id = b.snap_id
   and a.executions_delta > 0
   and a.elapsed_time_delta > 0
   and a.parsing_schema_name not in 
       ('MONITOR','SYS','SYSTEM','SYSMAN','DIP','TSMSYS','MGMT_VIEW','ORDSYS',
        'SCOTT','DBSNMP','ORACLE_OCM','OUTLN','SQLTXPLAIN','WMSYS','CTXSYS',
        'APPQOSSYS','SI_INFORMTN_SCHEMA','XDB','PERFSTAT','ACCOUNT','ANONYMOUS','DMSYS',
        'EXFSYS','MDDATA','MDSYS','OLAPSYS','ORDPLUGINS','OGG','DBVIEW') 
   and a.parsing_schema_name not like  'QUERY\_%' escape '\'
   and b.begin_interval_time >= sysdate - 8
 group by a.sql_id, a.parsing_schema_name;
 
 
-- 创建sql执行时间基线表 
create table sys.cebdba_sql_base_info
(sql_id varchar2(13),
 plan_hash_value number,
 parsing_schema_name varchar2(30),
 elapsed_time_base number
);
grant select,delete,update,insert on sys.cebdba_sql_base_info to dbsnmp;


3.如果sql在5分钟内执行过，计算单次执行时间
  a)由v$sql查询sql总的执行时间t1和执行次数c1
  b)由dba_hist_sqlstat查询快照中sql总的执行时间t2和执行次数c2
  c)增量执行时间：t1-t2
    增量执行次数：c1-c2
    单次执行时间：(t1-t2)/(c1-c2)

 
4.sql执行时间对比 
  elapsed_time_per_rate = 当前执行时间与最小执行时间之比 = elapsed_time_per/elapsed_time_base
  当该值大于一定值（阈值）时，即可认为该sql的执行时间有较大的增长，需要进行相应处理。
  

select sql_id,
       sql_text,
       parsing_schema_name,
       round((elapsed_time_delta / executions_delta) / elapsed_time_base) elapsed_time_per_rate
  from (select s.sql_text,
               s.sql_id,
               s.parsing_schema_name,
               s.elapsed_time,
               s.executions,
               s.elapsed_time -
               nvl((select max(t.elapsed_time_total)
                  from dba_hist_sqlstat t,dba_hist_snapshot a,v$instance b
                 where t.sql_id = s.sql_id
                   and t.parsing_schema_name = s.parsing_schema_name
                   and t.snap_id = a.snap_id
                   and a.startup_time >= b.startup_time),0) elapsed_time_delta,
               s.executions -
               nvl((select max(t.executions_total)
                  from dba_hist_sqlstat t,dba_hist_snapshot a,v$instance b
                 where t.sql_id = s.sql_id
                   and t.parsing_schema_name = s.parsing_schema_name
                   and t.snap_id = a.snap_id
                   and a.startup_time >= b.startup_time
                   ),0) executions_delta,
               q.elapsed_time_base
          from v$sql s, sys.cebdba_sql_base_info q
         where s.last_active_time >= sysdate - 5 / 24 / 60
           and s.parsing_schema_name not in 
               ('MONITOR','SYS','SYSTEM','SYSMAN','DIP','TSMSYS','MGMT_VIEW','ORDSYS',
                'SCOTT','DBSNMP','ORACLE_OCM','OUTLN','SQLTXPLAIN','WMSYS','CTXSYS',
                'APPQOSSYS','SI_INFORMTN_SCHEMA','XDB','PERFSTAT','ACCOUNT','ANONYMOUS','DMSYS',
                'EXFSYS','MDDATA','MDSYS','OLAPSYS','ORDPLUGINS','OGG','DBVIEW') 
           and s.parsing_schema_name not like  'QUERY\_%' escape '\'  
           and s.sql_id = q.sql_id
           and s.parsing_schema_name = q.parsing_schema_name)
 where executions_delta <> 0
   and executions <> 0;


问题：如果dba_hist_sqlstat与v$sql的elapsed_time_total和executions_total相同，则不返回任何记录
