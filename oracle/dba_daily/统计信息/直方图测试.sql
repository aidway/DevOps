sqlplus scott/tiger
create table t as select 1 id,object_name from dba_objects;
update t set id=99 where rownum=1;
commit;
create index ind_t on  t(id);
insert into t select * from t; -- 插入数据到100万
exec dbms_stats.gather_table_stats(user,'T',cascade=>true);



set line 200 pages 999
col owner for a10
col table_name for a10
col column_name for a15
SQL> select s.OWNER,
  2         s.TABLE_NAME,
  3         s.COLUMN_NAME,
  4         s.ENDPOINT_NUMBER,
  5         s.ENDPOINT_VALUE
  6    from dba_histograms s
  7   where s.table_name = 'T'
  8   order by s.COLUMN_NAME;

OWNER      TABLE_NAME COLUMN_NAME     ENDPOINT_NUMBER ENDPOINT_VALUE
---------- ---------- --------------- --------------- --------------
SCOTT      T          ID                            1             99
SCOTT      T          ID                            0              1
SCOTT      T          OBJECT_NAME                   1     4.9565E+35
SCOTT      T          OBJECT_NAME                   0     3.3882E+35



set autot trace exp
SQL> select * from t where id=99;
Execution Plan
----------------------------------------------------------
Plan hash value: 4013845416
-------------------------------------------------------------------------------------
| Id  | Operation                   | Name  | Rows  | Bytes | Cost (%CPU)| Time     |
-------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |       |   338 |  7436 |     7   (0)| 00:00:01 |
|   1 |  TABLE ACCESS BY INDEX ROWID| T     |   338 |  7436 |     7   (0)| 00:00:01 |
|*  2 |   INDEX RANGE SCAN          | IND_T |   338 |       |     4   (0)| 00:00:01 |
-------------------------------------------------------------------------------------
Predicate Information (identified by operation id):
---------------------------------------------------
   2 - access("ID"=99)


SQL> select * from t where id=1;
Execution Plan
----------------------------------------------------------
Plan hash value: 1601196873
--------------------------------------------------------------------------
| Id  | Operation         | Name | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |      |  1890K|    39M|  1594   (5)| 00:00:20 |
|*  1 |  TABLE ACCESS FULL| T    |  1890K|    39M|  1594   (5)| 00:00:20 |
--------------------------------------------------------------------------
Predicate Information (identified by operation id):
---------------------------------------------------
   1 - filter("ID"=1)




## 删除直方图信息，保留表和索引的统计信息
exec dbms_stats.delete_column_stats(user,'t','id');
SQL> select s.OWNER,
  2         s.TABLE_NAME,
  3         s.COLUMN_NAME,
  4         s.ENDPOINT_NUMBER,
  5         s.ENDPOINT_VALUE
  6    from dba_histograms s
  7   where s.table_name = 'T'
  8   order by s.COLUMN_NAME;

OWNER      TABLE_NAME COLUMN_NAME     ENDPOINT_NUMBER ENDPOINT_VALUE
---------- ---------- --------------- --------------- --------------
SCOTT      T          OBJECT_NAME                   1     4.9565E+35
SCOTT      T          OBJECT_NAME                   0     3.3882E+35


通过查询dba_tables和dba_indexes可以知道表和索引的统计信息还在。


SQL> select * from t where id=99;
Execution Plan
----------------------------------------------------------
Plan hash value: 4013845416
-------------------------------------------------------------------------------------
| Id  | Operation                   | Name  | Rows  | Bytes | Cost (%CPU)| Time     |
-------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |       | 18906 |   406K|  1519   (1)| 00:00:19 |
|   1 |  TABLE ACCESS BY INDEX ROWID| T     | 18906 |   406K|  1519   (1)| 00:00:19 |
|*  2 |   INDEX RANGE SCAN          | IND_T |  7562 |       |  3111   (1)| 00:00:38 |
-------------------------------------------------------------------------------------
Predicate Information (identified by operation id):
---------------------------------------------------
   2 - access("ID"=99)



SQL> select * from t where id=1;
Execution Plan
----------------------------------------------------------
Plan hash value: 4013845416
-------------------------------------------------------------------------------------
| Id  | Operation                   | Name  | Rows  | Bytes | Cost (%CPU)| Time     |
-------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |       | 18906 |   406K|  1519   (1)| 00:00:19 |
|   1 |  TABLE ACCESS BY INDEX ROWID| T     | 18906 |   406K|  1519   (1)| 00:00:19 |
|*  2 |   INDEX RANGE SCAN          | IND_T |  7562 |       |  3111   (1)| 00:00:38 |
-------------------------------------------------------------------------------------
Predicate Information (identified by operation id):
---------------------------------------------------
   2 - access("ID"=1)




