脚本功能：监控集群所有节点上使用cpu或内存最多的进程。

使用方法：
1.在调用脚本的节点上安装pdsh
2.同步脚本到集群其它节点：
  sh cpto.sh
3.运行监控脚本：
  -- 修改run.sh的变量
  # 需要进行监控的节点ip
  SERVER_IP=11.1.199.[1-10]
  # 需要监控进程的个数
  TOP_N=100
  # 监控时间间隔，单位为秒
  INTERVAL_SECOND=300
  # 监控文件保留时间，单位为天
  RESERVE_DAY=10

  -- 启动/停止监控
  sh run.sh start/stop

4.监控日志的目录：
  /root/tdhsoft/scripts/osinfo/cpu
  /root/tdhsoft/scripts/osinfo/mem
  
5.其它：
  -- 查看当前运行的监控脚本进程
  sh run.sh ps

  
  