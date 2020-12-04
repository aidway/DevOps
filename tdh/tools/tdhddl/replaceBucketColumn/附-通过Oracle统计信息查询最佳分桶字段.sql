-- 根据Oracle表的统计信息，得到最佳分桶字段。默认给出前3个建议的分桶字段。
select *
  from (select table_name,
               s.column_name,
               s.num_distinct,
               row_number() over(partition by table_name order by num_distinct desc) rn
          from dba_tab_col_statistics s
         where owner = 'SCOTT'
           and s.table_name not like 'BIN$%')
 where rn <= 3
 order by table_name, rn asc;

 

注意：以上查询结果受表的统计信息影响，为了得到更准确的结果，可以对表或用户收集统计信息。生产环境一般会按照策略定期收集统计信息。方法如下：

-- 收集用户的统计信息，采样比例为20%。（如果用户的大小超过100G，建议采样比例为5%）
exec dbms_stats.gather_schema_stats(ownname=>'SCOTT',estimate_percent=>20,cascade=>true,degree=>2);

-- 收集表的统计信息，采样比例为20%。（对于50G以上的表可以将采样比例降为5%，5G以下的表采样比例可以为100%）
exec dbms_stats.gather_table_stats(ownname=>'SCOTT',tabname=>'EMP',estimate_percent=>20,method_opt=>'FOR ALL',cascade=>TRUE);

 
 