一、脚本说明
===========================
本脚本用于TDH安装前检查操作系统环境。




二、运行环境
===========================
操作系统：rhel7.2、rhel7.4
依赖工具：pdsh




三、运行方法
===========================
1.填写配置文件
./conf/all_hosts : 待检查集群主机名和ip的连写形式
./conf/hosts     : 待检查集群的主机名和ip

例如：
./conf/all_hosts
-------------------------
192.168.1.[1-3] tdh[1-3]

./conf/hosts
-------------------------
192.168.1.1 tdh1
192.168.1.2 tdh2
192.168.1.3 tdh3

2.root用户运行脚本
$> sh run.sh

3.检查结果记录在./logs/error.log中。


四、检查项说明
===========================
1.IP地址与hostname是否对应。
2.是否开启了IPV6。
3.检查时区：
  Asia/Shanghai (CST, +0800)
  所有节点JVM读取的时区必须一致选择Asia Shanghai
4.检查DNS
  /etc/resolv.conf必须为空
  files 解析在DNS解析之前
5.检查OS LANG：en_US.UTF-8|en_US.GBK|zh_CK.UTF-8|zh_CK.GBK
6.检查iptables
7.检查selinux
8.硬件时钟
  






