1.ȷ�����ݿ⻷��
sqlplus / as sysdba
show parameter name;
show parameter db_files;
select * from dba_tablespace_usage_metrics;


2.����
-- ��������ļ�
alter tablespace ... add datafile '...' size 30000M autoextend off;

-- resize�����ļ�
alter database datafile '...' resize 30000M;


alter database datafile '/home/oracle/app/oracle/oradata/orcl/sysaux01.dbf' resize 2000M;


3.ȷ��
select * from dba_tablespace_usage_metrics;
���alert.log�Ƿ����쳣


ע��ʵ�ʱ��ʱ����ձ��ģ��



 
alter database datafile '/oradata/undo.dbf' resize 7000M;
