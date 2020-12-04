#!/bin/bash


# -----------------------------------------------------------------------------------------
#
# Filename:    run.sh
# Version:     1.0
# Date:        2017-1-3
# Author:      kwq
# Description: ssh trust
#
# -----------------------------------------------------------------------------------------


## check
[ `echo $# ` -ne 1 ] && echo "The number of parameters is wrong,please check." && echo -e "\nUsage:\n sh run.sh \$PASSWORD" && exit


## change to current dir
CURRENT_PATH=`dirname $0`
cd $CURRENT_PATH


## target server password
export SSHPASS=$1


## ssh-keygen
[ -f ~/.ssh/id_rsa ] || ssh-keygen -t rsa -f ~/.ssh/id_rsa -P ""


## install sshpass
if ! [ -f /usr/lib/sshpass/bin/sshpass ];then
    tar -xvf ./sshpass-1.06.tar.gz
    cd ./sshpass-1.06
    yum install gcc -y
    ./configure --prefix=/usr/lib/sshpass
    make
    make install 
    cp /usr/lib/sshpass/bin/sshpass /usr/bin/
    cd ../
fi


for IP in `cat ip.list`
do
    sshpass -e ssh-copy-id -i ~/.ssh/id_rsa.pub -o  StrictHostKeyChecking=no $IP
done


