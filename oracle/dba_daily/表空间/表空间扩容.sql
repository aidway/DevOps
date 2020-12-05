1.确认数据库环境
sqlplus / as sysdba
show parameter name;
show parameter db_files;
select * from dba_tablespace_usage_metrics;


2.扩容
-- 添加数据文件
alter tablespace ... add datafile '...' size 30000M autoextend off;

-- resize数据文件
alter database datafile '...' resize 30000M;


alter database datafile '/home/oracle/app/oracle/oradata/orcl/sysaux01.dbf' resize 2000M;


3.确认
select * from dba_tablespace_usage_metrics;
检查alert.log是否有异常


注：实际变更时请参照变更模板



 
alter database datafile '/oradata/undo.dbf' resize 7000M;
