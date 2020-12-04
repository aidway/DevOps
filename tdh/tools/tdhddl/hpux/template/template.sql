select 'create external table YYYYYYY_txt (' from dual
union all
select '   ' || 
       decode(rownum,1,'',',') ||
       t.sqlTxt
from  (select  column_name || ' ' ||
               case data_type
               when 'NUMBER' then '    decimal(' || data_length || ',' || nvl(data_scale,0) || ') '
               when 'FLOAT' then '    decimal(' || data_length || ',' || nvl(data_scale,0) || ') '
               when 'VARCHAR2' then '    string '
               when 'DATE' then '    string '
               when 'INTEGER' then '    decimal(38,0)'
               when 'CHAR' then '    string '
               end sqlTxt
        from   user_tab_columns 
        where  table_name='YYYYYYY'
        order  by COLUMN_ID asc
) t
union all
select ') row format DELIMITED FIELDS terminated by ''\001'' stored as textfile location ''ZZZZZZZ/' || 
       table_name || 
       ''';'   
from  user_tab_columns 
where table_name='YYYYYYY' 
and   rownum=1 ;
