select owner, index_name, partitioned, tablespace_name
  from dba_indexes
 where tablespace_name in ('OTPDB_A', 'OTPDB_B');

select s.index_owner, s.index_name, s.partition_name, s.tablespace_name
  from dba_ind_partitions s
 where s.tablespace_name in ('OTPDB_A', 'OTPDB_B')
 order by s.tablespace_name;

select owner, index_name, partitioned, tablespace_name
  from dba_indexes
 where index_name = 'IDX_USERID';

select a.owner, a.index_name, a.partitioned, b.tablespace_name
  from dba_indexes a, dba_segments b
 where a.index_name = b.segment_name
   and a.owner = b.owner
   and b.tablespace_name in ('OTPDB_A', 'OTPDB_B')
 order by b.tablespace_name;




-- 处理非分区索引
select 'alter index ' || s.owner || '.' || s.index_name || ' rebuild tablespace OTP_IDX;'
  from dba_indexes s
 where owner = 'OTPDB'
   and tablespace_name in ('OTPDB_A');



-- 处理分区索引
select 'alter index ' || index_owner || '.' || index_name || ' rebuild partition ' ||
       partition_name || ' tablespace OTP_HIDX;'
  from dba_ind_partitions s
 where s.tablespace_name in ('OTPDB_A', 'OTPDB_B')
 order by s.tablespace_name;