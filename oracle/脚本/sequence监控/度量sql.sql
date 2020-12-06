select s.sequence_owner || '.' || s.sequence_name || ': last_number=' ||
       s.last_number || '; max_value=' || s.max_value info,
       round(s.last_number / s.max_value) value
  from dba_sequences s
 where s.sequence_owner not like 'QUERY\_%' escape '\'
      and s.sequence_owner not in
          ('MONITOR','SYS','SYSTEM','DIP','TSMSYS','ORDSYS',
           'SCOTT','DBSNMP','ORACLE_OCM','OUTLN','SQLTXPLAIN','WMSYS','CTXSYS',
           'APPQOSSYS','SI_INFORMTN_SCHEMA','XDB','PERFSTAT','ACCOUNT','ANONYMOUS','DMSYS',
           'EXFSYS','MDDATA','MDSYS','OLAPSYS','ORDPLUGINS','OGG','DBVIEW') ;
