set line 200
col TSNAME for a20
set line 200 pages 999
col name for a30

-- ����ռ�ʹ����
set line 200
col TSNAME for a20
select a.tsname,
       round(a.total_m, 2) total_mb,
       round(nvl(a.total_m - b.free_m, 0), 2) used_mb,
       100 - round(nvl((b.free_m / a.total_m) * 100, 0), 2) used_pct
  from (select tablespace_name tsname, sum(bytes) / 1024 / 1024 total_m
          from dba_data_files
         group by tablespace_name) a,
       (select tablespace_name tsname, sum(bytes) / 1024 / 1024 free_m
          from dba_free_space
         group by tablespace_name) b,
       dba_tablespaces c
 where a.tsname = b.tsname(+)
   and a.tsname = c.tablespace_name
 order by used_pct;
 
-- ���Ӧ���û���Ĭ�ϱ�ռ� 
select  username,default_tablespace
  from dba_users 
 where username not in 
           ('MONITOR','SYS','SYSTEM','SYSMAN','DIP','TSMSYS','MGMT_VIEW','ORDSYS',
            'SCOTT','DBSNMP','ORACLE_OCM','OUTLN','SQLTXPLAIN','WMSYS','CTXSYS',
            'APPQOSSYS','SI_INFORMTN_SCHEMA','XDB','PERFSTAT','ACCOUNT','ANONYMOUS','DMSYS',
            'EXFSYS','MDDATA','MDSYS','OLAPSYS','ORDPLUGINS','DBVIEW') 
   and username not like  'QUERY\_%' escape '\' 
   and account_status='OPEN';
 
-- ���ʹ�����豸��������豸����
select name, bytes / 1024 / 1024 size_mb
  from v$datafile
union
select name, 50
  from v$controlfile
union
select name, bytes / 1024 / 1024
  from v$tempfile
union
select member,
       (select min(bytes) from v$log a where a.group# = group#) / 1024 / 1024
  from v$logfile
union
select value, 10 from v$parameter where name = 'spfile';


-- ��ѯcontrol�ļ���С
select block_size * file_size_blks / 1024 / 1024 size_mb
  from v$controlfile
 where rownum = 1;
select 16384*596/1024/1024 size_mb from dual;

-- ��ѯinstance_name��db_name
select name, value
  from v$parameter
 where name in ('instance_name', 'db_name');

-- ������ݿ��ַ���
select s.PARAMETER,s.VALUE
  from nls_database_parameters s
 where s.PARAMETER in ('NLS_CHARACTERSET', 'NLS_NCHAR_CHARACTERSET');

-- ���process
select name,value from v$parameter s where s.NAME ='processes'


-- ���pga��sga
select name,value/1024/1024
  from v$parameter s
 where s.NAME in ('pga_aggregate_target', 'sga_max_size');















