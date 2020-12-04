select 'create  table XXXXXXX ('
  from system.dual
union all
select '   ' || case
         when column_id = 0 then
          ''
         else
          ','
       end || sqlTxt
  from (select column_id,
               column_name || ' ' ||
               regexp_replace(column_type, ',ORACLE', '') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || regexp_replace(commentstring,'\;',',') || '"' sqlTxt
          from system.columns_v
         where database_name = 'YYYYYYY'
           and table_name = 'XXXXXXX'
         order by table_name, column_id asc)
union all
select case
         when bucket_column is not null then
          t1
         else
          t2
       end
  from (select bucket_column,
               ' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' ||
               bucket_number ||
               ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,
               ' ) stored as orc\;' t2
          from system.buckets_v
         right join system.dual
            on 1 = 1
           and database_name = 'YYYYYYY'
           and table_name = 'XXXXXXX');
