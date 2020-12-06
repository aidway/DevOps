-- 编译无效对象
@?/rdbms/admin/utlrp




alter packaget ... compile;



set line 200 pages 999
col owner for a15
col object_name for a30
col object_type for a15
col status for a10
select s.owner, s.OBJECT_NAME, s.OBJECT_TYPE, s.status
  from dba_objects s
 where s.status <> 'VALID';