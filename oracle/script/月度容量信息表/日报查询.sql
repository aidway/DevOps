-- 容量指标汇总信息
select s.db_name,
       s.capa_name    "容量指标名称",
       s.smonth       "月度",
       s.avg_value    "均值",
       s.avg_lrratio "均值环比",
       s.max_value    "峰值",
       s.max_lrratio "峰值环比"
  from p_monthly_cap s
 where s.smonth = to_char(add_months(trunc(sysdate), -1), 'yyyy-MM')
   and db_name =  'DZQD';

 
 

-- 表空间增长趋势信息
select s.db_name,
       s.db_id,
       s.db_role "DB角色（生产、测试）",
       s.tablespace_name "表空间名称",
       s.month_name "月度",
       s.check_time  "月度最后检查日期",
       s.tbs_size_mb "表空间总容量",
       s.free_size_mb "空闲容量",
       s.month_inc_mb "月度增加",
       s.used_pct "使用率",
       s.checkcnt "月度检查次数",
       s.em2f  "预估耗尽月数",
       s.em2w "预估报警月数（超80%）"
  from p_monthly_space s 
 where s.db_name =  'DZQD'
   and s.month_name = to_char(add_months(trunc(sysdate), -1), 'yyyyMM');