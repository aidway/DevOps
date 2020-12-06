监控sql：
select 'index_owner:' || s.index_owner || ', index_name:' || s.index_name ||
       ', partition_name:' || s.partition_name info,status
  from dba_ind_partitions s
 where s.status = 'UNUSABLE'
   and s.index_owner not in
       ('MONITOR','SYS','SYSTEM','SYSMAN','DIP','TSMSYS','MGMT_VIEW','ORDSYS',
        'SCOTT','DBSNMP','ORACLE_OCM','OUTLN','SQLTXPLAIN','WMSYS','CTXSYS',
        'APPQOSSYS','SI_INFORMTN_SCHEMA','XDB','PERFSTAT','ACCOUNT','ANONYMOUS','DMSYS',
        'EXFSYS','MDDATA','MDSYS','OLAPSYS','ORDPLUGINS','OGG','DBVIEW') 
   and index_owner not like  'QUERY\_%' escape '\' ;


调度频率：每天1次

告警级别：警告
