set line 200 pages 999
col TSNAME for a20
select nvl(b.tablespace_name, nvl(a.tablespace_name, 'unkown')) tsname,
       round(kbytes_alloc / 1024, 2) total_mb,
       round((kbytes_alloc - nvl(kbytes_free, 0)) / 1024, 2) used_mb,
       round(((kbytes_alloc - nvl(kbytes_free, 0)) / kbytes_alloc) * 100, 2) pct_used
  from (select sum(bytes) / 1024 kbytes_free, tablespace_name
          from sys.dba_free_space
         group by tablespace_name) a,
       (select sum(bytes) / 1024 kbytes_alloc,
               sum(maxbytes) / 1024 kbytes_max,
               tablespace_name
          from sys.dba_data_files
         group by tablespace_name) b
 where a.tablespace_name(+) = b.tablespace_name
 order by pct_used;


-- 查询指定表空间各对象的大小
select s.owner, s.segment_name, s.segment_type, s.bytes / 1024 / 1024
  from dba_segments s
 where s.tablespace_name = 'PLMS_INDX'
 order by s.bytes desc;


-- 所有表空间使用率（此视图在数据文件自动扩展情况下不准确）
select * from dba_tablespace_usage_metrics;


-- 查询临时表空间使用率
-- 11g
select tablespace_name,
       round(free_space / 1024 / 1024 / 1024, 2) "free(GB)",
       round(tablespace_size / 1024 / 1024 / 1024, 2) "total(GB)",
       round(nvl(free_space, 0) * 100 / tablespace_size, 3) "Free percent"
  from dba_temp_free_space;

-- 10g
SELECT temp_used.tablespace_name,
       total - used as "Free",
       total as "Total",
       round(nvl(total - used, 0) * 100 / total, 3) "Free percent"
  FROM (SELECT tablespace_name, SUM(bytes_used) / 1024 / 1024 used
          FROM GV_$TEMP_SPACE_HEADER
         GROUP BY tablespace_name) temp_used,
       (SELECT tablespace_name, SUM(bytes) / 1024 / 1024 total
          FROM dba_temp_files
         GROUP BY tablespace_name) temp_total
 WHERE temp_used.tablespace_name = temp_total.tablespace_name;


-- 临时文件大小
select file_name, s.tablespace_name, s.bytes / 1024 / 1024
  from dba_temp_files s;


-- undo空间active占用率
SELECT round(nvl((b.used_m / a.total_m) * 100, 0), 2) used_percentage
  from (select t.tablespace_name tsname, sum(f.bytes) / 1024 / 1024 total_m
          from dba_tablespaces t, dba_data_files f
         where t.tablespace_name = f.tablespace_name
           and t.contents = 'UNDO'
         group by t.tablespace_name) a,
       (select tablespace_name tsname, sum(bytes) / 1024 / 1024 used_m
          from dba_undo_extents
         where status in ('ACTIVE')
         group by tablespace_name) b
 where a.tsname = b.tsname(+);



select status,sum(bytes)/1024/1024 size_mb from dba_undo_extents group by status;




-- 查询数据库默认的表空间
set line 200
col PROPERTY_NAME for a30
col PROPERTY_VALUE for a20
col DESCRIPTION for a40
select *
  from database_properties s
 where s.PROPERTY_NAME in
       ('DEFAULT_TEMP_TABLESPACE', 'DEFAULT_PERMANENT_TABLESPACE');

alter database default tablespace ...;


---   表空间大小
col "总量" for a20
col "总量(M)" for 99999999
col "已用(M)" for 99999999 
col "剩余(M)" for 99999999
col "使用率(%)"  for 99.99
set linesize 200
set pages 99

select d.tablespace_name "表空间",
       maxbytes "总量(m)",
       space - nvl(free_space, 0) "已用(m)",
       maxbytes - (space - nvl(free_space, 0)) "剩余(m)",
       round((space - nvl(free_space, 0)) / maxbytes * 100, 2) "使用率(%)"
  from (select tablespace_name,
               round(sum(bytes) / (1024 * 1024), 2) space,
               round(sum(decode(maxbytes, 0, bytes, maxbytes)) /
                     (1024 * 1024),
                     2) maxbytes
          from dba_data_files
         group by tablespace_name) d,
       (select tablespace_name,
               round(sum(bytes) / (1024 * 1024), 2) free_space
          from dba_free_space
         group by tablespace_name) f
 where d.tablespace_name = f.tablespace_name(+)
union all
select d.tablespace_name "表空间",
       maxbytes "总量(m)",
       nvl(used_space, 0) "已用(m)",
       maxbytes - nvl(used_space, 0) "剩余(m)",
       round(nvl(used_space, 0) / maxbytes * 100, 2) "使用率(%)"
  from (select tablespace_name,
               round(sum(bytes) / (1024 * 1024), 2) space,
               round(sum(decode(maxbytes, 0, bytes, maxbytes)) /
                     (1024 * 1024),
                     2) maxbytes
          from dba_temp_files
         group by tablespace_name) d,
       (select tablespace,
               round(sum(blocks * 8192) / (1024 * 1024), 2) used_space
          from v$tempseg_usage
         group by tablespace) f
 where d.tablespace_name = f.tablespace(+)
 order by "使用率(%)" desc;
