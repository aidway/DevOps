select group#,status,bytes,members from v$log;
select group#,member from v$logfile;
alter system switch logfile;
alter system checkpoint;
alter database drop logfile group 1;
alter database add logfile group 1 ('D:\ORACLE\ORADATA\REPDB\REDO01a.LOG','D:\ORACLE\ORADATA\REPDB\REDO01b.LOG') size 500m;