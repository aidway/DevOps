select 'comment on column ' || s.TABLE_NAME || '.' || s.COLUMN_NAME || ' is ' || ''''|| t.COMMENTS || '''' || ';'
  from user_tab_columns s, user_col_comments t
 where s.TABLE_NAME = t.TABLE_NAME
   and s.COLUMN_NAME = t.COLUMN_NAME
   and t.COMMENTS is not null
   and s.TABLE_NAME in 
