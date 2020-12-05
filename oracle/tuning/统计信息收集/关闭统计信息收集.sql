在11g中，默认情况下，周一到周五晚十点收集，周末早六点收集


set line 200 pages 999
col client_name for a35
col task_name for a25
col status for a10
select client_name, status from dba_autotask_client;


-- 关闭auto optimizer stats collection
begin
dbms_auto_task_admin.disable (
client_name => 'auto optimizer stats collection',
operation => NULL,
window_name => NULL);
end;
/



-- 开启auto optimizer stats collection
begin
dbms_auto_task_admin.enable (
client_name => 'auto optimizer stats collection',
operation => NULL,
window_name => NULL);
end;
/

--查看自动收集任务历史执行状态
select client_name, window_name, jobs_created, jobs_started, jobs_completed
  from dba_autotask_client_history
 where client_name like '%stats%';


--查看自动收集任务执行时间窗口
select window_name, window_next_time, window_active, optimizer_stats
  from dba_autotask_window_clients
 order by window_next_time;
 

--查询自动收集任务正在执行的JOB
select client_name, job_scheduler_status
  from dba_autotask_client_job
 where client_name = 'auto optimizer stats collection';


--查询自动收集任务所属时间窗口组
select client_name, window_group
  from dba_autotask_client
 where client_name = 'auto optimizer stats collection';

--查询自动收集任务所属时间窗口组详细信息
select *
  from dba_scheduler_window_groups
 where window_group_name = 'ORA$AT_WGRP_OS';

--查看自动收集任务所属时间窗口组包含的子时间窗口
select *
  from dba_scheduler_wingroup_members
 where window_group_name = 'ORA$AT_WGRP_OS';
 
--查看子时间窗口信息
select a.window_name, a.next_start_date, a.active
  from dba_scheduler_windows a
 inner join dba_scheduler_wingroup_members b
    on a.window_name = b.window_name
 where b.window_group_name = 'ORA$AT_WGRP_OS';
 
 
 
