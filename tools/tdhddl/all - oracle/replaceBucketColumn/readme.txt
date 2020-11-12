脚本说明：替换orc ddl中的分桶字段和分桶个数

使用方法：
1.填写buckets.conf，格式为（不区分大小写）： 表名,分桶字段,分桶个数
2.修改run.sh，修改变量OWNER的值，此处填写要处理的OWNER名称
3.运行run.sh
sh run.sh

成功运行后，会在当前目录生成OWNER_orc.sql

