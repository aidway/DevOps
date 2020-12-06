-- �ؽ����������������������ӷ���
alter index xxx.xxxx rebuild online nologging;
alter index xxx.xxxx rebuild partition yyyyy online nologging;
alter index xxx.xxxx rebuild subpartition zzzzz online nologging;


-- �޸ķ���������Ĭ�ϱ�ռ�
alter index OTPDB.IDX_LOGNUM MODIFY DEFAULT ATTRIBUTES tablespace OTP_HIDX;



-- ������Ч����
---- �Ƿ�������
select 'alter index ' || s.owner || '.' || s.index_name || ' rebuild;'
  from dba_indexes s
 where s.status not in ('VALID', 'N/A')
   and s.owner not in ('SYS', 'SYSTEM');

---- ��������
select 'alter index ' || index_owner || '.' || index_name || ' rebuild partition ' ||
       partition_name || ';'
  from dba_ind_partitions s
 where status not in ('USABLE', 'N/A')
   and s.index_owner not in ('SYS', 'SYSTEM');


-- ������������Ϊ��Ч
alter index atmpwdb.t_eb_journal_pk modify partition p_maxval unusable;







