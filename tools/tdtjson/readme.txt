0.该脚本需要在oracle数据库服务器上运行

1.填写tables配置文件，格式如下：
表名（需要大写）|分桶字段|分桶数目|是否有日期类型字段(date或timestamp)
如：EMP|empno|1|DECIMAL(4)|hasDate=Y

2.修改run.sh的环境变量
USERNAME：登录oracle数据库的用户名
PASSWORD：登录oracle数据库的密码
OGG_DIR_HDFS：hdfs上存放tdt日志的目录
DBNAME：同步到Inceptor中表所在的数据库

例如（以scott/tiger登录到oracle，将tdt日志上传到/tmp/ogg/log，将表同步到Inceptor中的default数据库）：
USERNAME=scott
PASSWORD=tiger
OGG_DIR_HDFS=/tmp/ogg/log
DBNAME=default

3.在启动数据库实例的用户（一般是oracle）下运行run.sh脚本，生成test.json

注意：脚本生成的test.json，UniqueIdentifyKeys字段使用的步骤1中的分桶字段。但是，如果原表的主键是多字段，UniqueIdentifyKeys需要手动进行修改。



