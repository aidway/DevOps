select client_name, task_name, operation_name, status from dba_autotask_task;

select client_name, status from dba_autotask_client;


select program_type, program_action, enabled
  from dba_scheduler_programs
 where program_name = upper('auto_space_advisor_prog');




oracle 11g 默认的任务执行时间：
1. 星期一至星期五晚上 10 点开始，执行 4 个小时
2. 星期六，星期日早上 6 点开始，执行 20 个小时

select window_name, repeat_interval, duration, enabled
  from dba_scheduler_windows
 where enabled = 'TRUE';


-- 查看正在执行的自动任务
select client_name, job_scheduler_status from dba_autotask_client_job;


-- 查看执行历史
select client_name, window_name, window_start_time, window_duration
  from dba_autotask_client_history
 where rownum < 5;
