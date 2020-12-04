+-------------+
| 脚本功能    |
+-------------+
安装pdsh工具。



+-------------+
| 系统支持    |
+-------------+
1.centos6.*、centos7.*
2.rhel6.*、rhel7.*



+-------------+
| 目录结构    |
+-------------+
├── readme.txt           // 脚本说明文档
├── pdsh-2.26.zip        // pdsh安装包
├── run.sh               // 安装脚本



+-------------+
| 使用步骤    |
+-------------+
1.安装pdsh
root$> sh run.sh


2.验证
root$> pdsh -V
pdsh-2.26
rcmd modules: ssh,exec (default: ssh)
misc modules: (none)

如果rcmd modules的值中有ssh说明安装成功了。


3.使用
root$> pdsh -R ssh -w bd0[1-5] date

-R：指定传输方式，默认为rsh，本例为ssh，如果希望ssh传输需要另行安装pdsh-rcmd-ssh。
-w：指定待执行命令host，也可以这样配置，bd0[1-5]



