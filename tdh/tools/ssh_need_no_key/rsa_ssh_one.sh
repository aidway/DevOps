#!/bin/sh
local_ip="11.1.205.18"
other_ip="11.1.205.18 11.1.205.19 11.1.205.20 11.1.205.30 11.1.205.31 11.1.205.32 11.1.205.33 11.1.205.34"
passwd="123456"
doExpect()
{
  expect -c "set timeout 300; spawn $1; expect \"assword:\"; send \"$2\r\"; expect eof; exit"
}
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
for ip in $other_ip
do
        doExpect "ssh-copy-id -i /root/.ssh/id_rsa.pub root@$ip" "$passwd"
done





