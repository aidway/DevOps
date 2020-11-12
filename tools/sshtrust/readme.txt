+-------------+
| 脚本功能    |
+-------------+
配置单向SSH互信：配置当前运行脚本的节点到ip.list中节点的单向ssh互信。
注：由于配置SSH互信会依赖sshpass，因此脚本会首先安装sshpass。



+-------------+
| 系统支持    |
+-------------+
1.centos6.*、centos7.*
2.rhel6.*、rhel7.*



+-------------+
| 目录结构    |
+-------------+
├── ip.list                 // 待配置互信的ip清单
├── readme.txt              // 脚本说明文档
├── run.sh                  // 安装脚本
├── sshpass-1.06.tar.gz     // sshpass安装包



+-------------+
| 使用步骤    |
+-------------+
1.填写ip.list配置文件
假设运行脚本的节点是192.168.1.1，如果在ip.list中如下填写：
192.168.1.1
192.168.1.2
192.168.1.3
那么，最终将会实现192.168.1.1到192.168.1.[1-3]的ssh互信。

2.运行脚本:需要指定目标端服务器密码
root$> sh run.sh $PASSWORD


 

+-------------+
| 常见问题    |
+-------------+
1.make时报错
CDPATH="${ZSH_VERSION+.}:" && cd . && /bin/sh /root/tdhsoft/sshpass-1.06/missing aclocal-1.15 
/root/tdhsoft/sshpass-1.06/missing: line 81: aclocal-1.15: command not found
WARNING: 'aclocal-1.15' is missing on your system.
         You should only need it if you modified 'acinclude.m4' or
         'configure.ac' or m4 files included by 'configure.ac'.
         The 'aclocal' program is part of the GNU Automake package:
         <http://www.gnu.org/software/automake>
         It also requires GNU Autoconf, GNU m4 and Perl in order to run:
         <http://www.gnu.org/software/autoconf>
         <http://www.gnu.org/software/m4/>
         <http://www.perl.org/>
make: *** [aclocal.m4] Error 127

解决方法：
yum install automake 
autoreconf -ivf

