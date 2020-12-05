-- 分区表索引类型 global or local
select s.owner, s.index_name, table_name, partitioning_type, s.locality
  from dba_part_indexes s
 where owner = 'PBCEBDB';



select t.owner, t.table_name, i.owner, i.index_name
  from dba_part_tables t, dba_indexes i
 where i.table_owner = t.owner
   and i.table_name = t.table_name
   and i.PARTITIONED = 'NO';