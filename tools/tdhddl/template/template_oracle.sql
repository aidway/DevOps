select 'create  table YYYYYYY ('
  from dual
union all
select '   ' || decode(rownum, 1, '', ',') || t.sqlTxt
  from (select column_name || ' ' || case
                 when data_type = 'NUMBER' then '    NUMBER' ||
                    decode(DATA_PRECISION, null, '', '(' || DATA_PRECISION) || ',' ||
                    decode(data_scale, null, '', data_scale || ')')
                 when data_type = 'VARCHAR2' then '    VARCHAR2( ' || data_length || ') '
                 when data_type = 'NVARCHAR2' then '    NVARCHAR2( ' || data_length || ') '
                 when data_type = 'VARCHAR' then '    VARCHAR( ' || data_length || ') '
                 when data_type = 'CHAR' then '    CHAR( ' || data_length || ') '
                 when data_type = 'NCHAR' then '    NCHAR( ' || data_length || ') '
                 when instr(data_type, 'TIMESTAMP') > 0 then data_type
                 else data_type
                end sqlTxt
          from user_tab_columns
         where table_name = 'YYYYYYY'
         order by COLUMN_ID asc) t
union all
select ');'
  from dual;
