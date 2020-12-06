1���ռ�ͳ����Ϣ
begin
	dbms_stats.gather_table_stats(
		ownname          => 'CASH',
		tabname          => 'GLSINACCTLIST',
		estimate_percent => 20,
		method_opt       => 'FOR ALL',
		degree           => 2,
		cascade          => true
	);
end;
/

2�����ͳ����Ϣ�ռ����sqlִ�мƻ�
explain plan for ...
select * from table(dbms_xplan.display);

3.��ѯ����ʱ��
select to_char(stats_update_time,'yyyymmdd hh24:mi:ss') from dba_tab_stats_history where table_name='GLSINACCTLIST';
 
4.����
$>sqlplus /nolog
SQL>conn / as sysdba
SQL>begin
	DBMS_STATS.RESTORE_TABLE_STATS(
		ownname				   => 'CASH',
		tabname				   => 'GLSINACCTLIST',
		as_of_timestamp        =>  to_timestamp('yyyymmdd hh24:mi:ss','20141230 22:27:54')
	);
end;
/




-- �ռ��û���ͳ����Ϣ
exec dbms_stats.gather_schema_stats(ownname=>'CEBIFT',cascade=>true,degree=>2);

-- �ռ����ͳ����Ϣ
exec dbms_stats.gather_table_stats(ownname=>'ICARDKMS',tabname=>'RSAKEYPOOL',estimate_percent=>NULL,method_opt=>'FOR ALL INDEXED COLUMNS',cascade=>TRUE);
exec dbms_stats.gather_table_stats(user,'emp');



-- ��ȡ������Ĭ��ֵ
select dbms_stats.get_param('method_opt') from dual;


