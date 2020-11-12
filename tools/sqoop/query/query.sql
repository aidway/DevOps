-- 以下在sqlplus中执行，查询条件及table_name、ownser、sqoop参数等信息请根据实际情况修改
set pagesize 9999 feedback off heading off linesize 9999 trimspool on
spool sqoop.sql
select 'sqoop import --connect jdbc:oracle:thin:@11.1.34.33:1521:odsdb1 --username FDM --password FDM \' ||
       chr(10) || '--target-dir /oracle/fdm/' || table_name || ' \' || chr(10) ||
       '--fields-terminated-by "\\01" \' || chr(10) ||
       '--hive-drop-import-delims     \' || chr(10) ||
       '--null-string ''\\N''           \' || chr(10) ||
       '--null-non-string ''\\N''       \' || chr(10) ||
       '--fetch-size 5000            \' || chr(10) ||
       '--query  " select ' || listagg(t.sqoop, ',') within group(order by column_id asc) || ' from ' || table_name || ' where ODS_SRC_DT>''20161231'' and  \$CONDITIONS" \' || chr(10) || '-m 1 ' || chr(10) cols
  from (select s.table_name,
               case
                 when data_type = 'DATE' then
                  'to_char(' || s.COLUMN_NAME ||
                  ',''yyyy-MM-dd hh24:mi:ss'')'
                 when instr(data_type, 'TIMESTAMP') > 0 then
                  'to_char(' || s.COLUMN_NAME ||
                  ',''yyyy-MM-dd hh24:mi:ss'')'
                 else
                  s.COLUMN_NAME
               end sqoop,
               s.COLUMN_ID
          from dba_tab_columns s
         where s.TABLE_NAME in
               ('F_LN_XXT_FUND_JE_B', 'F_DP_VIEW_BJYBW')
           and owner = 'FDM'
         order by s.COLUMN_ID asc) t
 group by table_name;
spool off




