1、收集统计信息
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

2、检查统计信息收集后的sql执行计划
explain plan for ...
select * from table(dbms_xplan.display);

3.查询回退时间
select to_char(stats_update_time,'yyyymmdd hh24:mi:ss') from dba_tab_stats_history where table_name='GLSINACCTLIST';
 
4.回退
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




-- 收集用户的统计信息
exec dbms_stats.gather_schema_stats(ownname=>'CEBIFT',cascade=>true,degree=>2);

-- 收集表的统计信息
exec dbms_stats.gather_table_stats(ownname=>'ICARDKMS',tabname=>'RSAKEYPOOL',estimate_percent=>NULL,method_opt=>'FOR ALL INDEXED COLUMNS',cascade=>TRUE);
exec dbms_stats.gather_table_stats(user,'emp');



-- 获取参数的默认值
select dbms_stats.get_param('method_opt') from dual;


