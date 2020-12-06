select distinct 'sql_id:' || sql_id || ' sql_text:' ||  sql_text || 
       ' parsing_schema_name:' || parsing_schema_name || 
       ' last_active_time:' || to_char(last_active_time,'yyyy-MM-dd hh24:mi:ss') info,
       round((elapsed_time_delta / executions_delta) / elapsed_time_base) elapsed_time_per_rate
  from (select distinct s.sql_text,
               s.sql_id,
               s.parsing_schema_name,
               s.elapsed_time,
               s.executions,
               s.last_active_time,
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
               ('MONITOR','SYS','SYSTEM','DIP','TSMSYS','ORDSYS',
                'SCOTT','DBSNMP','ORACLE_OCM','OUTLN','SQLTXPLAIN','WMSYS','CTXSYS',
                'APPQOSSYS','SI_INFORMTN_SCHEMA','XDB','PERFSTAT','ACCOUNT','ANONYMOUS','DMSYS',
                'EXFSYS','MDDATA','MDSYS','OLAPSYS','ORDPLUGINS','OGG','DBVIEW') 
           and s.parsing_schema_name not like  'QUERY\_%' escape '\'  
           and s.sql_id = q.sql_id
           and s.parsing_schema_name = q.parsing_schema_name)
 where executions_delta <> 0
   and executions <> 0;