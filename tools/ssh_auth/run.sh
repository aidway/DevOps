#!/bin/bash

# target server password
export SSHPASS='123456'


for IP in `cat ip.list`
do
    sshpass -e ssh-copy-id -i ~/.ssh/id_rsa.pub -o  StrictHostKeyChecking=no $IP
done




