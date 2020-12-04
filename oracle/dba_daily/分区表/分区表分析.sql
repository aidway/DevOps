相关视图：
dba_tab_partitions
dba_tab_subpartitions
dba_part_tables
dba_part_indexes
dba_part_key_columns


set line 200 pages 999
col segment_name for a30
col partitioned for a15
col owner for a10
col table_owner for a10
col TABLE_NAME for a30
col COLUMN_NAME for a30
col index_name for a30
alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss';

-- 查询数据库有哪些分区索引
select owner, table_name, index_name
  from dba_part_indexes s
 where s.owner not in ('SYSTEM', 'SYS', 'DEMO')
 order by s.owner;

-- 查询有哪些分区表
select s.owner,s.table_name,s.def_tablespace_name
  from dba_part_tables s
 where s.owner not in ('SYSTEM', 'SYS', 'DEMO')
 order by s.owner;


-- 查询表的分区名
select s.table_owner, s.table_name, s.partition_name
  from dba_tab_partitions s
 where s.table_name in ('T_PB_LOG','T_EB_CNAPS_TRANDATA');



-- 查询分区表各子分区的大小
select a.owner,
       a.segment_name,
       a.partition_name,
       a.segment_type,
       a.BYTES,
       a.tablespace_name
  from dba_segments a
 where a.segment_name='WTCCONN_RT';


-- 查询SMDBDATA表空间下'%201409'分区的大小
select sum(a.BYTES)/1024/1024 size_MB
  from dba_segments a
 where a.partition_name like '%201409'
   and a.tablespace_name = 'SMDBDATA';


-- 分区表索引类型 global or local
select s.owner, s.index_name, table_name, partitioning_type, s.locality
  from dba_part_indexes s
 where owner = 'PBCEBDB'
   and index_name = 'T_PB_LOG_IDX2';


-- 查看分区键
col owner for a15
col name for a20
col object_type for 15
col column_name for a20
col column_position for 999 
select s.owner,s.name,s.column_name,s.column_position
  from dba_part_key_columns s
 where object_type = 'TABLE'
   and name in ('ECAS_TRAN_DATA')
 order by owner, name;



-- 生成删除分区语句
select 'alter table ' || s.table_owner || '.' || s.table_name ||
       ' drop partition ' || s.partition_name || ';' sql
  from dba_tab_partitions s
 where table_name = 'T_PB_LOG'
   and substr(partition_name, 3) < to_char(sysdate - 30, 'yyyymmdd')
 order by partition_name asc;



-- 检查最大分区
select table_owner, table_name, max(partition_name)
  from dba_tab_partitions
 where table_owner not in ('SYS', 'SYSTEM')
   and partition_name not like '%MAX%'
 group by table_owner, table_name
 order by table_owner;





