脚本说明：将应用新增表的查询权限赋给dbview用户。
使用说明：
1.登录到数据库服务器（应用服务器上无法执行该脚本）
2.将脚本上传到/home/sysadmin/dbtools目录下
3.sqlplus -S 应用用户名/应用用户密码   @/home/sysadmin/dbtools/grant_dbview.sql
