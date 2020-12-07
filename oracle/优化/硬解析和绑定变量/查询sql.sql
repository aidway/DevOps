##### 查询未绑定变量的sql
spool unsharing_sqls.txt 
SET pages 10000 
SET linesize 250 
column FORCE_MATCHING_SIGNATURE format 99999999999999999999999 
WITH c AS
 (SELECT FORCE_MATCHING_SIGNATURE, COUNT(*) cnt
    FROM v$sqlarea
   WHERE FORCE_MATCHING_SIGNATURE != 0
   GROUP BY FORCE_MATCHING_SIGNATURE
  HAVING COUNT(*) > 20),
sq AS
 (SELECT sql_text,
         FORCE_MATCHING_SIGNATURE,
         row_number() over(partition BY FORCE_MATCHING_SIGNATURE ORDER BY sql_id DESC) p
    FROM v$sqlarea s
   WHERE FORCE_MATCHING_SIGNATURE IN
         (SELECT FORCE_MATCHING_SIGNATURE FROM c))
SELECT sq.sql_text, sq.FORCE_MATCHING_SIGNATURE, c.cnt "unshared count"
  FROM c, sq
 WHERE sq.FORCE_MATCHING_SIGNATURE = c.FORCE_MATCHING_SIGNATURE
   AND sq.p = 1
 ORDER BY c.cnt DESC;
spool off 

##### 查询不同的sql版本
v$sql_shared_cursor

##### 查询适合绑定变量的sql
select substr(sql_text, 1, 40) sql, count(*), sum(executions) total_execs
  from v$sqlarea
 where executions < 5
 group by substr(sql_text, 1, 40)
having count(*) > 30
 order by 2;

##### 查询sql的绑定变量值
col VALUE_STRING for a20
col DATATYPE_STRING for a20
col name for a10
select name, datatype_string, VALUE_STRING
  from dba_hist_sqlbind s
 where sql_id = '833vu2ypt2hmk'
 order by name;


select name, datatype_string, VALUE_STRING
  from v$sql_bind_capture
 where sql_id = '833vu2ypt2hmk';



