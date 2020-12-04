select 'create  table YYYYYYY (' from dual
union all
select '   ' ||
       decode(rownum,1,'',',') ||
       t.sqlTxt
from  (select  column_name || ' ' ||
               case 
               when data_type='NUMBER' then '    decimal(' || nvl(DATA_PRECISION,38) || ',' || nvl(data_scale,10) || ') '
               when data_type='FLOAT' then '    decimal(38,10) '
               when data_type='VARCHAR2' then '    VARCHAR2( ' || data_length || ') '
               when data_type='NVARCHAR2' then '    string '
               when data_type='VARCHAR' then '    VARCHAR( ' || data_length || ') '
               when data_type='DATE' then '    timestamp '
               when data_type='INTEGER' then '    decimal(38,0)'
               when data_type='CHAR' then '    char( ' || data_length || ') '
               when data_type='NCHAR' then '    string '
               when instr(data_type,'TIMESTAMP')> 0 then data_type
               else 'string'
               end sqlTxt
        from   user_tab_columns
        where  table_name='YYYYYYY'
        order  by COLUMN_ID asc
) t
union all
select 
') ' || chr(10) ||
'clustered by (COLUMN) into NN buckets ' || chr(10) || 
'stored as orc ' || chr(10) || 
'tblproperties("transactional"="true");'
from dual;
