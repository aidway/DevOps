#!/bin/sh

for ((i=2;i<=9;i++))
do
    hostname=hnnxdn00$i
    scp /root/tdhsoft/scripts/diskCheck/run.sh $hostname:/root/tdhsoft/scripts/diskCheck/ 
done
for ((i=10;i<=42;i++))
do
    hostname=hnnxdn0$i
    scp /root/tdhsoft/scripts/diskCheck/run.sh $hostname:/root/tdhsoft/scripts/diskCheck/ 
done
