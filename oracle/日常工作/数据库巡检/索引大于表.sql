-- 索引大于表
select t.owner, t.table_name, t.size_mb, i.index_name, i.size_mb
  from (select i.table_owner,
               i.table_name,
               i.owner,
               i.index_name,
               sum(bytes) / 1024 / 1024 size_mb
          from dba_indexes i, dba_segments s
         where i.owner = s.owner
           and s.segment_name = i.index_name
         group by i.table_owner, i.table_name, i.owner, i.index_name) i,
       (select t.owner, t.table_name, sum(bytes) / 1024 / 1024 size_mb
          from dba_tables t, dba_segments s
         where t.owner = s.owner
           and s.segment_name = t.table_name
         group by t.owner, t.table_name) t
 where i.table_owner = t.owner
   and i.table_name = t.table_name
   and t.owner not in 
      ('SYS','SYSTEM','PERFSTAT','DBSNMP','OUTLN',
       'DRSYS','WKSYS','WMSYS','ORDSYS','MDSYS','CTXSYS','XDB','OE',
       'SH','QS','QS_ES','QS_WS','QS_OS','QS_CBADM','QS_CS','AURORA$JIS$UTILITY$','OSE$HTTP$ADMIN')
   and i.size_mb>t.size_mb
   and i.size_mb>5
order by 1,2,4;

--  shrink indexes
select 'alter index ' || t.owner || '.' || i.index_name || ' shrink space;'
  from (select i.table_owner,
               i.table_name,
               i.owner,
               i.index_name,
               sum(bytes) / 1024 / 1024 size_mb
          from dba_indexes i, dba_segments s
         where i.owner = s.owner
           and s.segment_name = i.index_name
         group by i.table_owner, i.table_name, i.owner, i.index_name) i,
       (select t.owner, t.table_name, sum(bytes) / 1024 / 1024 size_mb
          from dba_tables t, dba_segments s
         where t.owner = s.owner
           and s.segment_name = t.table_name
         group by t.owner, t.table_name) t
 where i.table_owner = t.owner
   and i.table_name = t.table_name
   and t.owner not in 
      ('SYS','SYSTEM','PERFSTAT','DBSNMP','OUTLN',
       'DRSYS','WKSYS','WMSYS','ORDSYS','MDSYS','CTXSYS','XDB','OE',
       'SH','QS','QS_ES','QS_WS','QS_OS','QS_CBADM','QS_CS','AURORA$JIS$UTILITY$','OSE$HTTP$ADMIN')
   and i.size_mb>t.size_mb
   and i.size_mb>5;

