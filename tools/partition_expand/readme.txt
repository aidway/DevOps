脚本说明：
为范围分区表自动扩展分区，按天分区扩展到未来30天，按月分区扩展到未来3个月，按年分区扩展到未来3年。


脚本使用：
1.修改run.sh
INCEPTOR_SERVER=11.1.199.2
USERNAME=hive
PASSWORD=123456
DATABASE_NAME=fdm,mdm

2.运行run.sh
sh run.sh


注意：
1.仅适用于按天/月/年的范围分区表。
2.如果范围分区表中有MAXVALUE分区，此时不能够再对该表进行扩展，执行脚本后会有报错信息：
##################################### WRONG INFO #####################################
f_bup_bupmtranjnl_bak,b_max,20201201,MAXVALUE,NULL,2018-01-16,NULL,NULL
......



