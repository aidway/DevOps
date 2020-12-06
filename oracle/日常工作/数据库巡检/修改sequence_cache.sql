-- ÐÞ¸Äsequence cache
select sequence_owner,sequence_name,cache_size 
  from dba_sequences 
 where cache_size<100 
   and sequence_owner not in ('SYSTEM','SYS','ACCOUNT','PERFSTAT','WMSYS','SQLTXPLAIN','SYSMAN','DBSNMP');

select 'alter sequence ' || sequence_owner || '.' ||  sequence_name || ' cache 100;' 
  from dba_sequences 
  where cache_size < 100 
    and sequence_owner not in ('SYSTEM','SYS','ACCOUNT','PERFSTAT','WMSYS','SQLTXPLAIN','SYSMAN','DBSNMP');
