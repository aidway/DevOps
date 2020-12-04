set pagesize 999  linesize 200 
col segment_name for a30
col partitioned for a15
col owner for a10
col table_owner for a10
col TABLE_NAME for a30
col COLUMN_NAME for a30
col index_name for a30
alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss';
 

variable owner varchar2(100) 
variable table_name varchar2(100) 
exec :owner := 'CEBIFT'
exec :table_name := 'TRANS_SEND'


spool /tmp/tabinfo.txt
-- table info: table_name, num_rows, bytes, last_analyzed, partitioned
select a.owner,
       a.table_name,
       b.partition_name,
       a.num_rows,
	   b.bytes / 1024 / 1024 size_mb,
	   a.last_analyzed,
       a.partitioned
  from dba_tables a, dba_segments b
 where a.table_name = upper(:table_name)
   and a.owner = upper(:owner)
   and a.table_name = b.segment_name
   and a.owner=b.owner
   order by a.owner;

   
-- index info: table_name, index_name, status, uniqueness, logging
select a.owner, a.table_name, b.index_name,b.status,b.uniqueness, c.BYTES / 1024 / 1024 size_mb
  from dba_tables a, dba_indexes b, dba_segments c
 where a.table_name = upper(:table_name)
   and a.table_name = b.table_name
   and a.owner = b.table_owner
   and a.owner  = upper(:owner)
   and b.index_name = c.segment_name;
 
 
-- index and column: table_name, index_name, column_name
select TABLE_OWNER, TABLE_NAME, INDEX_NAME, COLUMN_NAME, COLUMN_POSITION
  from dba_ind_columns
 where table_name = upper(:table_name)
   and table_owner = upper(:owner)
 order by table_name, index_name,COLUMN_POSITION asc; 
 
 
-- column distinct
select owner, table_name, COLUMN_NAME, NUM_DISTINCT
  from dba_tab_columns
 where table_name = upper(:table_name)
   and owner  = upper(:owner)
 order by NUM_DISTINCT desc;
 

-- part index info: index_name, partitioning_type, locality
select s.owner, s.table_name, s.index_name, s.partitioning_type, s.locality
  from dba_part_indexes s
 where s.owner = 'ECIFNOR'
   and s.table_name in ('T01_CUST_INFO')
 order by s.owner, s.table_name; 
spool off



