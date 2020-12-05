-- �ֹ��й鵵
alter system archive log all;


1��ͨ��alert.log�� ����һ��������Ϣ����session�ȴ��¼�ȷ�Ϲ鵵���⣻
2��ȷ�Ϲ鵵�ռ������㹻 ��
3��ʹ�� "alter system archive log all ; " ������ٻָ�ϵͳ���У�����֤�鵵�ռ���ã�
4������ log_archive_max_processes ���������ӹ鵵��������
5��kill ��������ľɹ鵵���̣�


-- �鿴���һ�ι鵵ʱ��
set pagesize 999 linesize 120
col last_arch_time for a20 
select thread# instance_id,
       to_char(max(completion_time), 'yyyymmdd hh24:mi:ss') last_arch_time
  from v$archived_log
 group by thread#
 order by instance_id;

 
-- �鿴�޷��鵵ʱ��
set pagesize 999 linesize 120
col log_seq for a12 
select p.thread# || '.' || p.group# || '.' || p.sequence# log_seq,
       round(86400 * (sysdate - n.first_time)) noarch_seconds
  from v$log p, v$log n
 where p.sequence# = n.sequence# - 1
   and p.archived = 'NO'
   and p.thread# = n.thread#;

-- ��ѯÿ��Ĺ鵵����
select to_char(s.FIRST_TIME, 'yyyyMMdd') arch_date, count(*)
  from v$archived_log s
 group by to_char(s.FIRST_TIME, 'yyyyMMdd')
 order by to_char(s.FIRST_TIME, 'yyyyMMdd');


-- ���spfile���Ƿ����sid��ͬ���ظ�����
col sid for a10
col name for a40
col value for a20
select s.sid,s.name,s.value from v$spparameter s;