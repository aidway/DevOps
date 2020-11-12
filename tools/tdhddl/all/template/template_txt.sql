select 'create external table XXXXXXX_txt.YYYYYYY (' from dual
union all
select '   ' || 
       decode(rownum,1,'',',') ||
       t.sqlTxt
from  (select  column_name || ' ' ||
               case 
               when data_type='NUMBER' then '    decimal(' || nvl(DATA_PRECISION,38) || ',' || nvl(data_scale,10) || ') '
               when data_type='FLOAT' then '    decimal(38,10) '
               when data_type='VARCHAR2' then '    string '
               when data_type='NVARCHAR2' then '    string '
               when data_type='VARCHAR' then '    string '
               when data_type='DATE' then '    string '
               when data_type='INTEGER' then '    decimal(38,0)'
               when data_type='CHAR' then '    string '
               when data_type='NCHAR' then '    string '
               when instr(data_type,'TIMESTAMP')> 0 then ' string '
               else 'string'
               end sqlTxt
        from   user_tab_columns 
        where  table_name='YYYYYYY'
        order  by COLUMN_ID asc
) t
union all
select ') ' || chr(10) || 'row format delimited fields terminated by ''\001''  lines terminated by ''\n'' ' || chr(10) || 
       'stored as textfile ' || chr(10) || 
       'location ''ZZZZZZZ/XXXXXXX/' || 
       table_name || 
       ''';'   
from  user_tab_columns 
where table_name='YYYYYYY' 
and   rownum=1 ;

 