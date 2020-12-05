-- INITIAL Extent > 100M
set line 200 pages 999
col owner for a20
col segment_type for a20
col segment_name for a40
select owner,
       segment_type,
       segment_name,
       round(initial_extent / 1024 / 1024) init_mb,
       min_extents
  from dba_segments
 where owner not in ('SYS', 'SYSTEM')
   and (round(initial_extent / 1024 / 1024) > 100 or min_extents > 1);



-- 表
select distinct 'alter table ' || s.owner || '.' || s.segment_name ||
                ' move storage(initial 128k);'
  from dba_segments s
 where owner not in ('SYS', 'SYSTEM')
   and (round(initial_extent / 1024 / 1024) > 100 or min_extents > 1)
   and s.segment_type = 'TABLE';


-- 表分区
select 'alter table ' || s.owner || '.' || s.segment_name ||
       ' move partition ' || s.partition_name || ' storage(initial 128k); '
  from dba_segments s
 where owner not in ('SYS', 'SYSTEM')
   and (round(initial_extent / 1024 / 1024) > 100 or min_extents > 1)
   and s.segment_type = 'TABLE PARTITION'
 order by 1;


-- 非分区索引 
select 'alter index ' || s.owner || '.' || s.segment_name ||
       ' rebuild  storage(initial 256K );'
  from dba_segments s
 where owner not in ('SYS', 'SYSTEM')
   and (round(initial_extent / 1024 / 1024) > 100 or min_extents > 1)
   and s.segment_type = 'INDEX';

 
-- 分区索引 
select 'alter index ' || s.owner || '.' || s.segment_name ||
       ' rebuild partition ' || s.partition_name ||
       ' storage(initial 256K );'
  from dba_segments s
 where owner not in ('SYS', 'SYSTEM')
   and (round(initial_extent / 1024 / 1024) > 100 or min_extents > 1);
