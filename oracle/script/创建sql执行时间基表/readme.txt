###############  脚本说明  ###############
创建sql执行时间基表并初始化，sql_id由配置文件sqlid_config指定。




###############  操作步骤  ###############
1.填写配置文件sqlid_config
a)实例名
b)sql_id

2.使用oracle用户运行脚本init_sql_base.sh
sh init_sql_base.sh



###############  回退步骤  ###############
sqlplus / as sysdba
drop table cebdba_sql_base_info purge;