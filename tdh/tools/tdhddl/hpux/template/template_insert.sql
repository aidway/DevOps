select 'insert into  YYYYYYY select ' from dual
union all
select '   ' ||
       decode(rownum,1,'',',') ||
       t.sqlTxt
from  (select   
               case 
               when data_type='DATE' then 
                 'tdh_todate(' || column_name ||', ''yyyy-MM-dd HH:mm:ss'',''yyyy-MM-dd HH:mm:ss'')'
               when instr(data_type,'TIMESTAMP')> 0 then 
                 'tdh_todate(' || column_name ||', ''yyyy-MM-dd HH:mm:ss'',''yyyy-MM-dd HH:mm:ss'')'  
               else column_name
               end sqlTxt
        from   user_tab_columns
        where  table_name='YYYYYYY'
        order  by COLUMN_ID asc
) t
union all
select 'from XXXXXXX_txt.YYYYYYY;'  from dual;
