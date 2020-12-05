��11g�У�Ĭ������£���һ��������ʮ���ռ�����ĩ�������ռ�


set line 200 pages 999
col client_name for a35
col task_name for a25
col status for a10
select client_name, status from dba_autotask_client;


-- �ر�auto optimizer stats collection
begin
dbms_auto_task_admin.disable (
client_name => 'auto optimizer stats collection',
operation => NULL,
window_name => NULL);
end;
/



-- ����auto optimizer stats collection
begin
dbms_auto_task_admin.enable (
client_name => 'auto optimizer stats collection',
operation => NULL,
window_name => NULL);
end;
/

--�鿴�Զ��ռ�������ʷִ��״̬
select client_name, window_name, jobs_created, jobs_started, jobs_completed
  from dba_autotask_client_history
 where client_name like '%stats%';


--�鿴�Զ��ռ�����ִ��ʱ�䴰��
select window_name, window_next_time, window_active, optimizer_stats
  from dba_autotask_window_clients
 order by window_next_time;
 

--��ѯ�Զ��ռ���������ִ�е�JOB
select client_name, job_scheduler_status
  from dba_autotask_client_job
 where client_name = 'auto optimizer stats collection';


--��ѯ�Զ��ռ���������ʱ�䴰����
select client_name, window_group
  from dba_autotask_client
 where client_name = 'auto optimizer stats collection';

--��ѯ�Զ��ռ���������ʱ�䴰������ϸ��Ϣ
select *
  from dba_scheduler_window_groups
 where window_group_name = 'ORA$AT_WGRP_OS';

--�鿴�Զ��ռ���������ʱ�䴰�����������ʱ�䴰��
select *
  from dba_scheduler_wingroup_members
 where window_group_name = 'ORA$AT_WGRP_OS';
 
--�鿴��ʱ�䴰����Ϣ
select a.window_name, a.next_start_date, a.active
  from dba_scheduler_windows a
 inner join dba_scheduler_wingroup_members b
    on a.window_name = b.window_name
 where b.window_group_name = 'ORA$AT_WGRP_OS';
 
 
 
