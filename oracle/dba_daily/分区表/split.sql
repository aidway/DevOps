select TABLE_NAME, PARTITION_NAME, HIGH_VALUE
  from user_tab_partitions s
  where s.table_name = 'CFIM_SEALCTRL_RECORD'
 order by TABLE_NAME, PARTITION_NAME;


alter table CFIM_SEALCTRL_RECORD 
split partition P_201504 at (TO_DATE('2015-04-1 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'))
into (partition P_201503 , partition P_201504);


alter table pbebisdb.t_pb_log 
split partition  P_MAX  at ('20151127') 
into (partition P_20151126,partition P_MAX);




-- splitºó¼ì²éË÷Òý×´Ì¬
select index_owner, index_name, partition_name,status
  from dba_ind_partitions s
 where status not in ('USABLE', 'N/A')
   and s.index_owner not in ('SYS', 'SYSTEM');

select index_owner, index_name, partition_name, subpartition_name, status
  from dba_ind_subpartitions
 where status not in ('USABLE')
 order by 1, 2, 3, 4;