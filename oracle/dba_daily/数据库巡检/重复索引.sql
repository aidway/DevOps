select TABLE_OWNER, TABLE_NAME, INDEX_NAME, COLUMN_NAME, COLUMN_POSITION
  from dba_ind_columns
 where table_name in ('REL_RES_USER')
   and table_owner in ('CMMESSC')
 order by table_name, index_name,COLUMN_POSITION asc;