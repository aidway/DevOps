-- ²éÑ¯µ¼ÖÂËÀËøµÄsql
select sql_id, count(*)
  from v$active_session_history
 where event = 'enq: TX - row lock contention'
   and sample_time > to_date('20150616 18:00', 'yyyymmdd hh24:mi')
   and sample_time < to_date('20150616 18:40', 'yyyymmdd hh24:mi')
 group by sql_id
 order by 2;


01-05 01:58:04:582636£­01-05 02:56:47:659764




select sql_id, count(*)
  from v$active_session_history
 where sample_time > to_date('20141103 11:00', 'yyyymmdd hh24:mi')
   and sample_time < to_date('20141103 12:00', 'yyyymmdd hh24:mi')
 group by sql_id
 order by 2;


select s.sql_text from v$sql s where s.sql_id in ('5gxy4dbfqfzph','4qtccah0wwgq0');

 