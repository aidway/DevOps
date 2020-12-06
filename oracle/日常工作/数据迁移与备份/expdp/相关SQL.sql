set line 200 pages 999
col owner for a15
col DIRECTORY_NAME for a25
col DIRECTORY_PATH for a30
select * from dba_directories;



SQL> col owner_name for a20
SQL> col job_name for a20
SQL> col state for a20
SQL> select owner_name,job_name,state from DBA_DATAPUMP_JOBS;

OWNER_NAME           JOB_NAME             STATE
-------------------- -------------------- --------------------
CEBPLMS              CEBPLMS_EXPORT_2     EXECUTING
CEBPLMS              CEBPLMS_EXPORT       NOT RUNNING





-- É¾³ýmaster±í
drop table cebplms.CEBPLMS_EXPORT;