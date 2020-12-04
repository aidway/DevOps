set pagesize 1000 feedback off heading off linesize 180 trimspool on
spool /tmp/grant_privs_to_dbview.sql
select 'grant select on ' || a.table_name || ' to dbview;' sql
  from user_tables a
 where not exists (select 1
          from user_tab_privs b
         where a.table_name = b.table_name
           and b.grantee = 'DBVIEW');
select 'grant select on ' || a.view_name || ' to dbview;' sql
  from user_views a
 where not exists (select 1
          from user_tab_privs b
         where a.view_name = b.table_name
           and b.grantee = 'DBVIEW');
spool off
start /tmp/grant_privs_to_dbview.sql
exit


-- 调用方法
sqlplus -S 应用用户名/应用用户密码 @grant_dbview.sql
