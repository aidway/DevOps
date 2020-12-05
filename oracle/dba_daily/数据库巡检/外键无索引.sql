set linesize 180 pagesize 1000 long 9999
set head off
set feedback off
col owner for a30
col table_name for a30
col constraint_name for a30
col column_name for a30
SELECT dcc.owner, dcc.table_name, dcc.constraint_name, dcc.column_name
  FROM DBA_CONSTRAINTS DC, DBA_CONS_COLUMNS DCC, dba_ind_columns di
 where DC.constraint_type = 'R'
   and dc.owner = dcc.owner
   and dc.constraint_name = dcc.constraint_name
   and dc.table_name = dcc.table_name
   and dcc.table_name = di.table_name(+)
   and dcc.owner = di.table_owner(+)
   and dcc.column_name = di.column_name(+)
   and dcc.position = di.column_position(+)
   and di.index_name is null
   and dc.owner not in 
      ('SYS','SYSTEM','PERFSTAT','DBSNMP','OUTLN',
      'DRSYS','WKSYS','WMSYS','ORDSYS','MDSYS','CTXSYS','XDB',
      'OE','SH','QS','QS_ES','SQLTXPLAIN','SYSMAN','QS_WS',
      'QS_OS','QS_CBADM','QS_CS','AURORA$JIS$UTILITY$',
      'OSE$HTTP$ADMIN','ORDDATA','OLAPSYS','EXFSYS','SCOTT')
 order by 1,2,3,dcc.position; 