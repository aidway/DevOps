select case s.DATA_TYPE
       when 'DATE' then '              "tdh_todate(' || column_name || ',''yyyy-MM-dd:HH:mm:ss'',''yyyy-MM-dd HH:mm:ss'')",'
       when 'TIMESTAMP(6)' then '              "tdh_todate(' || column_name || ',''yyyy-MM-dd HH-mm-ss'')",'
       else '              "' || column_name || '",'
       end
  from user_tab_columns s
 where table_name = upper('XXXXXXX')
 order by COLUMN_ID asc;