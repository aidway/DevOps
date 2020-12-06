set linesize 180 pagesize 1000 long 9999
col name for a30
col unrecoverable_time for a40
select t.name, d.name, d.unrecoverable_time
  from v$datafile d,
       (select file#, max(completion_time) backup_time
          from v$backup_datafile
         group by file#) b,
       v$tablespace t
 where d.ts# = t.ts#
   and d.unrecoverable_time is not null
   and d.file# = b.file#(+)
   and (b.backup_time is null or b.backup_time < d.unrecoverable_time);

NAME                           NAME                           UNRECOVERABLE_TIME
------------------------------ ------------------------------ ----------------------------------------
CEBIFT                         /dev/cebift/cebift_app1        2016-02-02 22:01:45


0级备份：
configure channel device type disk format '/arch/%d_%I_%s_%p_%T.bkp';
backup as compressed backupset database plus archivelog;


删除0级备份：
delete noprompt  backupset ;
