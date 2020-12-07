alter session set nls_date_format = 'yyyy-mm-dd,hh24:mi:ss';
set linesize 400 pages 999
col sql_Id format a20
col name format a20
col datatype_string format a14
col value_string format a20

-- 根据缓存查询绑定变量
select sql_id,hash_value,name,datatype_string,value_string,last_captured
  from v$sql_bind_capture
 where sql_id = '31w43w3ty7zrd'
 order by last_captured, position;
 
 
-- 根据awr查询绑定变量
select snap_id, sql_id, name, datatype_string, value_string, last_captured
  from dba_hist_sqlbind
 where sql_id = '31w43w3ty7zrd'
 order by snap_id desc, name asc;



