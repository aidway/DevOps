-- 重建索引、索引分区、索引子分区
alter index xxx.xxxx rebuild online nologging;
alter index xxx.xxxx rebuild partition yyyyy online nologging;
alter index xxx.xxxx rebuild subpartition zzzzz online nologging;


-- 修改分区索引的默认表空间
alter index OTPDB.IDX_LOGNUM MODIFY DEFAULT ATTRIBUTES tablespace OTP_HIDX;



-- 处理无效索引
---- 非分区索引
select 'alter index ' || s.owner || '.' || s.index_name || ' rebuild;'
  from dba_indexes s
 where s.status not in ('VALID', 'N/A')
   and s.owner not in ('SYS', 'SYSTEM');

---- 分区索引
select 'alter index ' || index_owner || '.' || index_name || ' rebuild partition ' ||
       partition_name || ';'
  from dba_ind_partitions s
 where status not in ('USABLE', 'N/A')
   and s.index_owner not in ('SYS', 'SYSTEM');


-- 将分区索引置为无效
alter index atmpwdb.t_eb_journal_pk modify partition p_maxval unusable;







