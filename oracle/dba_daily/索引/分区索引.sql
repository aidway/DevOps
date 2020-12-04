-- 建本地分区索引
create index pbebisdb.ebis_t_pb_log_ind1 on pbebisdb.t_pb_log (trandate,trantime) local tablespace cebip_indx online;


-- 查询分区表的索引是local还是global
select owner, table_name, index_name, table_name, locality
  from dba_part_indexes
 where owner not in ('SYS', 'SYSTEM')
 order by owner;


-- 查询分区表上索引是否分区
select s.owner,
       s.table_name,
       t.index_name,
       t.index_type,
       t.uniqueness,
       t.partitioned
  from dba_part_tables s, dba_indexes t
 where s.owner not in ('SYS', 'SYSTEM')
   and s.owner = t.table_owner
   and s.table_name = t.table_name
 order by s.owner;
