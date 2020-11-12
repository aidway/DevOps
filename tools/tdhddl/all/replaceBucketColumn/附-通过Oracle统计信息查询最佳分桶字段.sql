-- ����Oracle���ͳ����Ϣ���õ���ѷ�Ͱ�ֶΡ�Ĭ�ϸ���ǰ3������ķ�Ͱ�ֶΡ�
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

 

ע�⣺���ϲ�ѯ����ܱ��ͳ����ϢӰ�죬Ϊ�˵õ���׼ȷ�Ľ�������ԶԱ���û��ռ�ͳ����Ϣ����������һ��ᰴ�ղ��Զ����ռ�ͳ����Ϣ���������£�

-- �ռ��û���ͳ����Ϣ����������Ϊ20%��������û��Ĵ�С����100G�������������Ϊ5%��
exec dbms_stats.gather_schema_stats(ownname=>'SCOTT',estimate_percent=>20,cascade=>true,degree=>2);

-- �ռ����ͳ����Ϣ����������Ϊ20%��������50G���ϵı���Խ�����������Ϊ5%��5G���µı������������Ϊ100%��
exec dbms_stats.gather_table_stats(ownname=>'SCOTT',tabname=>'EMP',estimate_percent=>20,method_opt=>'FOR ALL',cascade=>TRUE);

 
 