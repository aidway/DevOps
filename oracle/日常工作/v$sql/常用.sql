-- ��ѯsqlִ����ʷ���ԱȲ�ִͬ�мƻ���ִ��ʱ��
select snap_id,
       sql_id,
       plan_hash_value,
       round(elapsed_time_delta / executions_delta) elapsed_time_per
  from dba_hist_sqlstat
 where sql_id = '4vak44m1h6f9t'
   and executions_delta > 0
 order by snap_id desc;