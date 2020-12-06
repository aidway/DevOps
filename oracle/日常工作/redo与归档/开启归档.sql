###############  变更步骤  ###############
1.开归档前检查
sqlplus / as sysdba
### 如果参数log_archive_dest非空，要先将该参数置为空
show parameter log_archive_dest 
NAME                                 TYPE                   VALUE
------------------------------------ ---------------------- ------------------------------
log_archive_dest                     string                 /arch

alter system reset log_archive_dest scope=spfile sid='*';


2.开启归档
sqlplus / as sysdba
create pfile='/tmp/20151202_init.ora' from spfile;
alter system set log_archive_dest_1='location=/arch' scope=spfile sid='*';
shutdown immediate;
startup mount;
alter database archivelog;
alter database open;
archive log list


3.验证
alter system switch logfile;


###############  回退步骤  ###############
sqlplus / as sysdba
alter system reset log_archive_dest_1  scope=spfile sid='*';
shutdown immediate;
startup mount;
alter database noarchivelog;
alter database open;
archive log list




### 注意：设置log_archive_dest（该参数已废弃）
alter system set log_archive_dest='/arch' scope=spfile;

-- 关归档，mount模式下
alter database noarchivelog;