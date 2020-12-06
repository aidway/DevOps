###############  Ŀ��  ###############
���ִ��ʱ��ͻ����sql���ӳ�ʱ��Ϊ5���ӡ�




###############  ����  ###############
1.ȷ��Ҫ��ص�sql������dba����Ŀ�鹲ͬȷ��


2.ȷ��sqlִ��ʱ��Ļ���:�����ڵ����ִ��ʱ��
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
 
 
-- ����sqlִ��ʱ����߱� 
create table sys.cebdba_sql_base_info
(sql_id varchar2(13),
 plan_hash_value number,
 parsing_schema_name varchar2(30),
 elapsed_time_base number
);
grant select,delete,update,insert on sys.cebdba_sql_base_info to dbsnmp;


3.���sql��5������ִ�й������㵥��ִ��ʱ��
  a)��v$sql��ѯsql�ܵ�ִ��ʱ��t1��ִ�д���c1
  b)��dba_hist_sqlstat��ѯ������sql�ܵ�ִ��ʱ��t2��ִ�д���c2
  c)����ִ��ʱ�䣺t1-t2
    ����ִ�д�����c1-c2
    ����ִ��ʱ�䣺(t1-t2)/(c1-c2)

 
4.sqlִ��ʱ��Ա� 
  elapsed_time_per_rate = ��ǰִ��ʱ������Сִ��ʱ��֮�� = elapsed_time_per/elapsed_time_base
  ����ֵ����һ��ֵ����ֵ��ʱ��������Ϊ��sql��ִ��ʱ���нϴ����������Ҫ������Ӧ����
  

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


���⣺���dba_hist_sqlstat��v$sql��elapsed_time_total��executions_total��ͬ���򲻷����κμ�¼
