-- ����ָ�������Ϣ
select s.db_name,
       s.capa_name    "����ָ������",
       s.smonth       "�¶�",
       s.avg_value    "��ֵ",
       s.avg_lrratio "��ֵ����",
       s.max_value    "��ֵ",
       s.max_lrratio "��ֵ����"
  from p_monthly_cap s
 where s.smonth = to_char(add_months(trunc(sysdate), -1), 'yyyy-MM')
   and db_name =  'DZQD';

 
 

-- ��ռ�����������Ϣ
select s.db_name,
       s.db_id,
       s.db_role "DB��ɫ�����������ԣ�",
       s.tablespace_name "��ռ�����",
       s.month_name "�¶�",
       s.check_time  "�¶����������",
       s.tbs_size_mb "��ռ�������",
       s.free_size_mb "��������",
       s.month_inc_mb "�¶�����",
       s.used_pct "ʹ����",
       s.checkcnt "�¶ȼ�����",
       s.em2f  "Ԥ���ľ�����",
       s.em2w "Ԥ��������������80%��"
  from p_monthly_space s 
 where s.db_name =  'DZQD'
   and s.month_name = to_char(add_months(trunc(sysdate), -1), 'yyyyMM');