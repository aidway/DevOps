set line 200 pages 999
col segment_name for a30
col partitioned for a15
col owner for a10
col table_owner for a10
col TABLE_NAME for a30
col COLUMN_NAME for a30
col index_name for a30
alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss';

##################  非分区表  ##################
-- 表的分析时间、大小
select a.owner,
       a.table_name,
       a.last_analyzed,
       a.num_rows,
       a.partitioned,
       b.bytes / 1024 / 1024 size_mb
  from dba_tables a, dba_segments b
 where a.table_name in ('T_EB_MER_CLR_RESULT')
   and a.table_name = b.segment_name
   and a.owner=b.owner
   order by a.owner;

-- 表上索引的大小
select a.owner, a.table_name, b.index_name, c.BYTES / 1024 / 1024 size_mb
  from dba_tables a, dba_indexes b, dba_segments c
 where a.table_name in ('T01_CUST_INFO')
   and a.table_name = b.table_name
   and a.owner = b.table_owner
    and a.OWNER=c.owner
       and a.owner='ECIFNOR'
   and b.index_name = c.segment_name;


-- 分区表的信息
select TABLE_OWNER, TABLE_NAME, PARTITION_NAME, NUM_ROWS, LAST_ANALYZED
  from dba_tab_partitions
 where table_name = 'T_PB_LOG'
   and TABLE_OWNER = 'PBCEBDB'
   order by table_owner,table_name,PARTITION_NAME;


-- 查询列的distinct
select owner, table_name, COLUMN_NAME, NUM_DISTINCT
  from dba_tab_columns
 where table_name = 'T_PB_LOG'
    and  owner='PBCEBDB'
order by NUM_DISTINCT desc
 ;

   
-- 查询表上的索引
select s.table_name,s.table_owner,s.owner, s.index_name, s.status,s.uniqueness,s.logging
  from dba_indexes s
 where s.table_owner in ('AML')
   and s.table_name in ('AL_DE_JY')
 order by s.table_owner,s.table_name,s.index_name;

-- 分区索引类型
select s.owner, s.index_name, s.table_name, s.partitioning_type, s.locality
  from dba_part_indexes s
 where s.owner = 'ECIFNOR'
   and s.table_name in ('T01_CUST_INFO')
 order by s.owner, s.table_name;

-- 分区表索引类型
select s.owner, s.index_name, table_name, partitioning_type, s.locality
  from dba_part_indexes s
 where owner = 'PBCEBDB'
   and table_name in ( 'T_PB_LOG',''); 


-- 查询索引建在哪些列上
select TABLE_OWNER, TABLE_NAME, INDEX_NAME, COLUMN_NAME, COLUMN_POSITION
  from dba_ind_columns
 where table_name in ('ECR_TMP_BD')
   and table_owner in ('CECM')
 order by table_name, index_name,COLUMN_POSITION asc;





-- 查看索引状态
set linesize 180 pagesize 1000 long 9999
col owner for a25
col index_name for a35
col partition_name for a40
col index_owner for a30
col subpartition_name for a50
select owner, index_name, status
  from dba_indexes
 where status not in ('VALID', 'N/A')
 order by 1, 2;
select index_owner, index_name, partition_name, status
  from dba_ind_partitions
 where status not in ('USABLE', 'N/A')
 order by 1, 2, 3;
select index_owner, index_name, partition_name, subpartition_name, status
  from dba_ind_subpartitions
 where status not in ('USABLE')
 order by 1, 2, 3, 4;

-- 查询列的统计信息
select column_name,
       NUM_DISTINCT,
       utl_raw.cast_to_varchar2(LOW_VALUE) low,
       low_value,
       utl_raw.cast_to_varchar2(HIGH_VALUE) high,
       high_value,
       DENSITY,
       NUM_NULLS,
       LAST_ANALYZED,
       AVG_COL_LEN,
       HISTOGRAM
  from dba_tab_col_statistics
 where table_name = 'RT_FILESYSTEM';


----收集表的统计信息
analyze table WF_MAIN_RECORD COMPUTE STATISTICS;
analyze table WF_MAIN_RECORD ESTIMATE  STATISTICS;



begin
	dbms_stats.gather_table_stats(
		ownname          => 'CFIM',
		tabname          => 'WF_MAIN_RECORD',
		estimate_percent => 10,
		degree           => 2,
		cascade          => true
	);
end;
/


-- 查询表的数据分布在多少个块上
select count(distinct dbms_rowid.rowid_block_number(rowid)) block_cnts
  from cebift.PLAT_LIST_FILE_INFO;


-- 查询每个块上有多少行数据
select dbms_rowid.rowid_block_number(rowid)block_num , count(*) rows_per_block
  from cebift.PLAT_LIST_FILE_INFO
 group by dbms_rowid.rowid_block_number(rowid)
 order by rows_per_block asc;
