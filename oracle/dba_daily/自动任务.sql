select client_name, task_name, operation_name, status from dba_autotask_task;

select client_name, status from dba_autotask_client;


select program_type, program_action, enabled
  from dba_scheduler_programs
 where program_name = upper('auto_space_advisor_prog');




oracle 11g Ĭ�ϵ�����ִ��ʱ�䣺
1. ����һ������������ 10 �㿪ʼ��ִ�� 4 ��Сʱ
2. ������������������ 6 �㿪ʼ��ִ�� 20 ��Сʱ

select window_name, repeat_interval, duration, enabled
  from dba_scheduler_windows
 where enabled = 'TRUE';


-- �鿴����ִ�е��Զ�����
select client_name, job_scheduler_status from dba_autotask_client_job;


-- �鿴ִ����ʷ
select client_name, window_name, window_start_time, window_duration
  from dba_autotask_client_history
 where rownum < 5;
