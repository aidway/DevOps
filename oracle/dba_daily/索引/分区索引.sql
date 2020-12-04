-- �����ط�������
create index pbebisdb.ebis_t_pb_log_ind1 on pbebisdb.t_pb_log (trandate,trantime) local tablespace cebip_indx online;


-- ��ѯ�������������local����global
select owner, table_name, index_name, table_name, locality
  from dba_part_indexes
 where owner not in ('SYS', 'SYSTEM')
 order by owner;


-- ��ѯ�������������Ƿ����
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
