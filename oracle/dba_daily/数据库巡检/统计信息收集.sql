-- ���ͳ����ϢΪ�յ��û�
select distinct(owner) 
  from dba_tables 
 where last_analyzed is null  
   and owner not in ('SYS','SYSTEM','PERFSTAT','DBSNMP','OUTLN','DRSYS',
                     'WKSYS','WMSYS','ORDSYS','MDSYS','CTXSYS','XDB','OE',
                     'SH','QS','QS_ES','SQLTXPLAIN','SYSMAN','QS_WS','QS_OS',
                     'QS_CBADM','QS_CS','AURORA$JIS$UTILITY$','OSE$HTTP$ADMIN',
                     'APPQOSSYS','MGMT_VIEW','ORACLE_OCM','DIP','TSMSYS','OLAPSYS',
                     'EXFSYS','DBVIEW');

sqlplus / as sysdba
exec dbms_stats.gather_schema_stats(ownname=>'��дӦ���û�����',cascade=>true,degree=>2);

exec dbms_stats.gather_schema_stats(ownname=>'CEBIFT',cascade=>true,degree=>2);


-- ͳ����Ϣδ�ռ����û�����
select distinct (owner) ,table_name
  from dba_tables 
 where last_analyzed is null 
   and owner not in 
       ('SYS','SYSTEM','PERFSTAT','DBSNMP','OUTLN','DRSYS',
        'WKSYS','WMSYS','ORDSYS','MDSYS','CTXSYS','XDB','OE',
        'SH','QS','QS_ES','SQLTXPLAIN','SYSMAN','QS_WS','QS_OS',
        'QS_CBADM','QS_CS','AURORA$JIS$UTILITY$','OSE$HTTP$ADMIN',
        'APPQOSSYS','MGMT_VIEW','ORACLE_OCM','DIP','TSMSYS','OLAPSYS','EXFSYS')
;

-- �ռ����ͳ����Ϣ
exec dbms_stats.gather_schema_stats(ownname=>'OTPDB',cascade=>true,degree=>2);