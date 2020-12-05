set linesize 180 pagesize 1000 long 9999
select u.username,
       nvl(q.tablespace_name, 'SYSTEM'),
       DECODE(q.max_bytes, -1, 'UNLIMITED', null, 'QUOTA NOT SET')
  from dba_ts_quotas q, dba_users u
 where u.username = q.username(+)
   and u.username not in 
      ('PERFSTAT','SQLTXPLAIN','DBSNMP','OLAPSYS','SYS','SYSTEM','WMSYS','OUTLN','DIP','MGMT_VIEW','ORACLE_OCM','TSMSYS')
   and (q.tablespace_name in ('SYSTEM') or q.tablespace_name is null)
   and (q.max_bytes=-1 or max_bytes is null);




alter user ICCARDKMS quota 0 on sysaux;
revoke unlimited tablespace from ICCARDKMS ;