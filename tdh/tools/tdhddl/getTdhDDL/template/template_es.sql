select 'create  table YYYYYYY (' from dual
union all
select '   ' || 
       decode(rownum,1,'',',') ||
       t.sqlTxt
from  (select  column_name || ' ' ||
               case 
               when data_type='NUMBER' then '    double  '
               when data_type='FLOAT' then '    float '
               when data_type='VARCHAR2' then '    string '
               when data_type='NVARCHAR2' then '    string '
               when data_type='VARCHAR' then '    string '
               when data_type='DATE' then '    string '
               when data_type='INTEGER' then '    double '
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
select ') stored as es;'   
from  user_tab_columns 
where table_name='YYYYYYY' 
and   rownum=1 ;
