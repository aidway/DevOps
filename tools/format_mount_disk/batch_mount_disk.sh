################################# 一键集群格式化挂载磁盘 ##################################
##使用时修改以下参数：
#cluster_ip    集群所有节点的ip
#passwd        root用户登录密码
#DEVICE_LIST   需要格式化的磁盘列表
#dir           需要mount的起始路径，如：第一块盘mount在/mnt/disk1  则dir=1 ；后面按顺序递增

#注意：
#  1. 如果是初次安装，没有执行过ssh命令连接到其他主机上，doExpect() 注释掉第二行，解注释第一行
#     如果执行过ssh命令，doExpect()函数函数不用修改
#  2 不能选择系统盘所在磁盘！！！！！！！
#  3 只适合单块磁盘只创建一个分区的情况！！！！！
#  4 如果不保留免密登录   请把第61行解注释
###########################################################################################

#!/bin/bash


cluster_ip="172.16.2.154 172.16.2.136"
DEVICE_LIST="/dev/sdb /dev/sdc"
passwd="123456"
dir=1

if !(rpm -qa | grep expect);then
    echo "Install expect....."
    rpm -ivh tcl-8.5.7-6.el6.x86_64.rpm
    rpm -ivh expect-5.44.1.15-5.el6_4.x86_64.rpm
    exit 0
fi

doExpect()
{
    #expect -c "set timeout 30; spawn $1; expect \"(yes/no)?\"; send \"yes\n\"; expect \"*assword\"; send \"$2\n\"; expect eof; exit"
	expect -c "set timeout 30; spawn $1; expect \"assword:\"; send \"$2\r\"; expect eof; exit"
}
rm -rf ./remote_mount
mkdir ./remote_mount
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
for ip_addr in $cluster_ip
do
    echo "+++++++++++++++ $ip_addr formating and mountting disk ++++++++++++++++++++"
    echo "#!/bin/bash" > ./remote_mount/mount_${ip_addr}.sh
    echo "DEVICE_LIST=\"$DEVICE_LIST\"" >> ./remote_mount/mount_${ip_addr}.sh
    echo "dir=$dir" >> ./remote_mount/mount_${ip_addr}.sh
    cat mount.sh >> ./remote_mount/mount_${ip_addr}.sh
    echo "+++++++++++++++ the result of $ip_addr mountting ++++++++++++++++++++" >> mount_out.log
    if ( ip addr | grep $ip_addr ); then
        sh ./remote_mount/mount_${ip_addr}.sh
        df -h >> mount_out.log
    else
        echo "df -h >> mount_out_${ip_addr}.log" >> ./remote_mount/mount_${ip_addr}.sh
        doExpect "ssh-copy-id -i /root/.ssh/id_rsa.pub root@$ip_addr" "$passwd"
        scp ./remote_mount/mount_${ip_addr}.sh root@$ip_addr:/root/
        ssh root@$ip_addr "sh /root/mount_${ip_addr}.sh"
        ssh root@$ip_addr "rm -f /root/mount_${ip_addr}.sh"
        scp root@$ip_addr:/root/mount_out_${ip_addr}.log ./remote_mount/
        #如果不用ssh免密登录，把下面的公钥删除
        #ssh root@$ip_addr "rm -f /root/.ssh/authorized_keys"
        cat ./remote_mount/mount_out_${ip_addr}.log >> mount_out.log
    fi
done

