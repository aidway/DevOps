ͼ�λ����棺 asmca
�����й��ߣ� asmcmd



-- �鿴diskgroup�ռ��С���Լ�ASM״̬
select name, total_mb, free_mb, usable_file_mb, state
  from v$asm_diskgroup;



-- �鿴ASMӲ����Ϣ
col PATh for a10
col FAILGROUP for a10
set line 128 pages 999
column name for a10
select group_number, disk_number, name, mount_status, header_status,
mode_status, state, path, failgroup, mount_date, total_mb, free_mb
from v$asm_disk order by group_number, disk_number;




set line 200 pages 999
col name for a15
col type for a10
col state for a10
col path for a30


-- ��ѯ����DG
select name,type,state,total_mb,free_mb  from v$asm_diskgroup;


��������
�ⲿ���ࣺasm�������ݿ��ļ��������ô������٣���Ч���̿ռ������д��̿ռ�Ĵ�С֮��
�������ࣺasmʹ��2�ݾ���洢��������Ҫ������̣���Ч���̿ռ������д����豸��С��1/2
�����ࣺasmʹ��3�ݾ���洢��������Ҫ������̣���Ч���̿ռ������д����豸��С��1/3




