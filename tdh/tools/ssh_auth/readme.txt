一.安装sshpass
tar -xvf sshpass-1.06.tar.gz
cd /root/tdhsoft/sshpass-1.06
./configure --prefix=/usr/lib/sshpass
make
make install 
cp /usr/lib/sshpass/bin/sshpass /usr/bin/

-- 验证
$> sshpass
Usage: sshpass [-f|-d|-p|-e] [-hV] command parameters
   -f filename   Take password to use from file
   -d number     Use number as file descriptor for getting password
   -p password   Provide password as argument (security unwise)
   -e            Password is passed as env-var "SSHPASS"
   With no parameters - password will be taken from stdin

   -h            Show help (this screen)
   -V            Print version information
At most one of -f, -d, -p or -e should be used


$> sshpass -p '123456' ssh hnnx-dn1
$> sshpass -p '123456' scp /tmp/test hnnx-dn1:/tmp/

二.在本机生成： id_rsa.pub
$> ssh-keygen

三.修改run.sh中的环境变量：
-- 目标端服务器密码
SSHPASS='123456'

四.运行run.sh
sh run.sh


