-- ��ѯ���ݿ��Զ��ռ�����
select CLIENT_NAME,status from dba_autotask_client;

select job_name, enabled, state
  from dba_scheduler_jobs s
 where s.job_name = 'BSLN_MAINTAIN_STATS_JOB';



-- ��ѯwindow��Ϣ
select window_name,active,ENABLED from ALL_SCHEDULER_WINDOWS;
exec dbms_scheduler.disable('CEBDBA_STATS_COMMON_WINDOW'); 
exec dbms_scheduler.close_window('CEBDBA_STATS_COMMON_WINDOW'); 