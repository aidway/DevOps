###############  �������  ###############
1.���鵵ǰ���
sqlplus / as sysdba
### �������log_archive_dest�ǿգ�Ҫ�Ƚ��ò�����Ϊ��
show parameter log_archive_dest 
NAME                                 TYPE                   VALUE
------------------------------------ ---------------------- ------------------------------
log_archive_dest                     string                 /arch

alter system reset log_archive_dest scope=spfile sid='*';


2.�����鵵
sqlplus / as sysdba
create pfile='/tmp/20151202_init.ora' from spfile;
alter system set log_archive_dest_1='location=/arch' scope=spfile sid='*';
shutdown immediate;
startup mount;
alter database archivelog;
alter database open;
archive log list


3.��֤
alter system switch logfile;


###############  ���˲���  ###############
sqlplus / as sysdba
alter system reset log_archive_dest_1  scope=spfile sid='*';
shutdown immediate;
startup mount;
alter database noarchivelog;
alter database open;
archive log list




### ע�⣺����log_archive_dest���ò����ѷ�����
alter system set log_archive_dest='/arch' scope=spfile;

-- �ع鵵��mountģʽ��
alter database noarchivelog;