select '              "' || column_name || '",'
  from user_tab_columns
 where table_name = upper('XXXXXXX')
 order by COLUMN_ID asc;
