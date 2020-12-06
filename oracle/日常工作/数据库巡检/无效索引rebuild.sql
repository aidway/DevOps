-- 非分区索引
select 'alter index ' || s.owner || '.' || s.index_name || ' rebuild;'
  from dba_indexes s
 where s.status not in ('VALID', 'N/A')
   and s.owner not in ('SYS', 'SYSTEM');

-- 分区索引
select index_owner, index_name, partition_name,status
  from dba_ind_partitions s
 where status not in ('USABLE', 'N/A')
   and s.index_owner not in ('SYS', 'SYSTEM');

select index_owner, index_name, partition_name, subpartition_name, status
  from dba_ind_subpartitions
 where status not in ('USABLE')
 order by 1, 2, 3, 4;


select 'alter index ' || index_owner || '.' || index_name || ' rebuild partition ' ||
       partition_name || ';'
  from dba_ind_partitions s
 where status not in ('USABLE', 'N/A')
   and s.index_owner not in ('SYS', 'SYSTEM');