-- 11g
select b.INSTANCE_NAME, 10 cnt
  from dba_autotask_client a,v$instance b
 where a.CLIENT_NAME = 'sql tuning advisor'
   and a.STATUS='ENABLED';



select distinct key_value
  from mgmt$alert_history
 where metric_name = 'ME$sql_tuning_advisor_info'
   and alert_state = 'Warning'
   order by key_value desc;





-- 10g
select b.instance_name || ',' || a.task_name info, 10 cnt
  from dba_advisor_tasks a, v$instance b
 where a.advisor_name = 'SQL Tuning Advisor';

select substr(key_value2, 1, instr(key_value2, ',', 1, 1) - 1) instance_name
  from mgmt$alert_history
 where alert_state = 'Warning'
   and key_value = 'sql_tuning_advisor_info';   
   

