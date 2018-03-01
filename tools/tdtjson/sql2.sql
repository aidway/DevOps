select '              "' ||
       case data_type
         when 'NUMBER' then
          'decimal(' || data_length || ',' || nvl(data_scale, 0) || ')'
         when 'FLOAT' then
          'decimal(' || data_length || ',' || nvl(data_scale, 0) || ')'
         when 'VARCHAR2' then
          'string'
         when 'DATE' then
          'string'
         when 'INTEGER' then
          'decimal(38,0)'
         when 'CHAR' then
          'string' 
       end || '",'
  from user_tab_columns
 where table_name = upper('XXXXXXX')
 order by COLUMN_ID asc;

