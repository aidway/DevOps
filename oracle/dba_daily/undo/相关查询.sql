select tablespace_name, status, sum(bytes) / 1024 / 1024
  from dba_undo_extents
 group by tablespace_name, status;

SELECT KTUXEUSN rollback_segs_num,
       KTUXESIZ * 8 / 1024 undo_size_mb,
       KTUXESIZ undo_blocks,
       KTUXESLT,
       KTUXESQN, /* Transaction ID */
       KTUXESTA Status,
       KTUXECFL Flags
  FROM x$ktuxe
 where KTUXESTA != 'INACTIVE'
 order by 2;

select usn,
       state,
       undoblockstotal "Total",
       undoblocksdone "Done",
       undoblockstotal - undoblocksdone "ToDo",
       decode(cputime,
              0,
              'unknown',
              sysdate + (((undoblockstotal - undoblocksdone) /
              (undoblocksdone / cputime)) / 86400)) "Estimated time to complete"
  from v$fast_start_transactions;

select distinct s.sid,
                t.xidusn,
                t.xidslot,
                t.xidsqn,
                round(t.used_ublk * 8 / 1024, 2) undo_MB,
                used_urec undo_records,
                s.machine,
                s.program,
                s.status,
                l.sql_text,
                s.logon_time
  from v$transaction t, v$session s, v$sqlarea l
 where t.ses_addr = s.saddr
   and decode(s.sql_hash_value, 0, s.prev_hash_value, s.sql_hash_value) =
       l.hash_value(+)
 order by undo_MB;
