### ssh_ras.sh
#!/bin/sh
local_ip="172.16.2.175"
other_ip="172.16.2.173 172.16.2.174"
passwd="123456"
yum install expect
mkdir ./rsa
doExpect()
{
  expect -c "set timeout 30; spawn $1; expect \"assword:\"; send \"$2\r\"; expect eof; exit"
}
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
for ip in $other_ip
do
	sh root@$ip "yum install expect"
    doExpect "ssh-copy-id -i /root/.ssh/id_rsa.pub root@$ip" "$passwd"
    echo "#!/bin/sh" > ./rsa/rsa_${ip}.sh
    echo "local_ip=\"$ip\"" >> ./rsa/rsa_${ip}.sh
    echo "other_ip=\"${other_ip/$ip/}" "${local_ip}\"" >> ./rsa/rsa_${ip}.sh
    echo "passwd=\"$passwd\"" >> ./rsa/rsa_${ip}.sh
    cat rsa.txt >> ./rsa/rsa_${ip}.sh
    doExpect "scp ./rsa/rsa_${ip}.sh root@$ip:/root/" "$passwd"
    ssh root@$ip "sh /root/rsa_${ip}.sh"
    ssh root@$ip "rm -f /root/rsa_${ip}.sh"
done
