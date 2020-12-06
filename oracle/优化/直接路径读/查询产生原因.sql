SELECT a.event,
       a.sid,
       c.sql_hash_value hash_vale,
       decode(d.ktssosegt,
              1,
              'SORT',
              2,
              'HASH',
              3,
              'DATA',
              4,
              'INDEX',
              5,
              'LOB_DATA',
              6,
              'LOB_INDEX',
              NULL) AS segment_type,
       b.tablespace_name,
       b.file_name
  FROM v$session_wait a, dba_data_files b, v$session c, x$ktsso d
 WHERE c.saddr = d.ktssoses(+)
   AND c.serial# = d.ktssosno(+)
   AND d.inst_id(+) = userenv('instance')
   AND a.sid = c.sid
   AND a.p1 = b.file_id
   AND a.event = 'direct path read'
UNION ALL
SELECT a.event,
       a.sid,
       d.sql_hash_value hash_value,
       decode(e.ktssosegt,
              1,
              'SORT',
              2,
              'HASH',
              3,
              'DATA',
              4,
              'INDEX',
              5,
              'LOB_DATA',
              6,
              'LOB_INDEX',
              NULL) AS segment_type,
       b.tablespace_name,
       b.file_name
  FROM v$session_wait a,
       dba_temp_files b,
       v$parameter    c,
       v$session      d,
       x$ktsso        e
 WHERE d.saddr = e.ktssoses(+)
   AND d.serial# = e.ktssosno(+)
   AND e.inst_id(+) = userenv('instance')
   AND a.sid = d.sid
   AND b.file_id = a.p1 - c.VALUE
   AND c.NAME = 'db_files'
   AND a.event = 'direct path read' 
