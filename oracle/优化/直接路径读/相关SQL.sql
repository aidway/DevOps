select * from v$active_session_history where event='direct path read';


select a.ksppinm name,
       b.ksppstvl value,
       b.ksppstdf deflt,
       decode(a.ksppity,
              1,
              'boolean',
              2,
              'string',
              3,
              'number',
              4,
              'file',
              a.ksppity) type,
       a.ksppdesc description
  from sys.x$ksppi a, sys.x$ksppcv b
 where a.indx = b.indx
   and a.ksppinm like '\_serial_direct_read%' escape '\';

   
   
select sql_id, count(*)
  from dba_hist_active_sess_history
 where event = 'direct path read'
 group by sql_id
 order by 2 desc;



select *
  from dba_hist_active_sess_history
 where event = 'direct path read'
 order by 2 desc;
