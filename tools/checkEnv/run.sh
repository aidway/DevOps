#!/bin/sh


# -----------------------------------------------------------------------------------------
#
# Filename:    run.sh
# Version:     1.0
# Date:        2018-6-28
# Author:      kwq
# Description: check os env
# OS:          rhel7.2
# Note:        rely on pdsh
# -----------------------------------------------------------------------------------------

# check pdsh
[ `which pdsh 2>/dev/null | wc -l ` -eq 0 ] && echo "Install pdsh first!";exit;

# init
source ./conf/all_hosts

echo '' > ./logs/error.log


# 1.check ip and hostname
pdsh -R ssh -w $ALL_IP hostname | sort >  ./logs/hostname.log
cat ./logs/hostname.log | while read i
do
    IP=`echo $i | sed 's/[[:space:]]//g' | awk -F ":" '{print $1}'`
    HOSTNAME_ACTUAL=`echo $i | sed 's/[[:space:]]//g' | awk -F ":" '{print $2}'`
    HOSTNAME_EXPECT=`cat ./conf/hosts | grep -w $IP  | awk -F ' ' '{print $2}' | sed 's/[[:space:]]//g'`
    [ "$HOSTNAME_ACTUAL"  != "$HOSTNAME_EXPECT" ] && echo "IP=$IP, HOSTNAME=$HOSTNAME_ACTUAL. HOSTNAME should be [$HOSTNAME_EXPECT]." >> ./logs/error.log
done

# 2.check ipv6
pdsh -R ssh -w $ALL_IP 'ifconfig | grep inet6 | head -n 1' > ./logs/ipv6.log
if [ `cat ./logs/ipv6.log | wc -l ` -gt 0 ];then
    echo "ipv6 are opend:" >> ./logs/error.log
    cat ./logs/ipv6.log >> ./logs/error.log
fi
rm -f ./logs/ipv6.log

# 3.check timezone
## Time zone: Asia/Shanghai (CST, +0800)
pdsh -R ssh -w $ALL_IP timedatectl | grep "zone" | grep -v Shanghai > ./logs/timezone.log
if [ `cat ./logs/timezone.log | wc -l ` -gt 0 ];then
    echo "Time zone error:" >> ./logs/error.log
    cat ./logs/timezone.log >> ./logs/error.log
fi
rm -f ./logs/timezone.log


# 所有节点JVM读取的时区必须一致选择Asia Shanghai 
pdsh -R ssh -w $ALL_IP ls -l /etc | grep -i localtime  | grep -v Shanghai > ./logs/jvm_timezone.log
if [ `cat ./logs/jvm_timezone.log | wc -l `  -gt 0 ];then
    echo "JVM timezone error:" >> ./logs/error.log
    cat ./logs/jvm_timezone.log >> ./logs/error.log
fi
rm -f ./logs/jvm_timezone.log


# 4.check dns
## cat /etc/resolv.conf should be empty
pdsh -R ssh -w $ALL_IP 'cat /etc/resolv.conf  | grep -v "#" | grep -v "^$" | wc -l' | awk -F ":" '{if ($2 > 0)print $1 " resolv.conf is not empty."}' > ./logs/dns.log
if [ `cat ./logs/dns.log | wc -l ` -gt 0 ]; then
    echo "/etc/resolv.conf should is not empty:" >> ./logs/error.log
    cat ./logs/dns.log >> ./logs/error.log
fi
rm -f ./logs/dns.log

## files 解析在DNS解析之前
pdsh -R ssh -w $ALL_IP 'cat  /etc/nsswitch.conf | grep -i dns | grep -v "#"' | grep -v  ".*files.*dns.*" > ./logs/dns_file.log
if [ `cat ./logs/dns_file.log | wc -l ` -gt 0 ];then
    echo "file must be before dns:"  >>  ./logs/error.log
    cat ./logs/dns_file.log >> ./logs/error.log
fi
rm -f ./logs/dns_file.log


# 5.OS LANG:en_US.UTF-8|en_US.GBK|zh_CK.UTF-8|zh_CK.GBK
pdsh -R ssh -w $ALL_IP 'env | grep LANG  ' | grep -vE 'en_US.UTF-8|en_US.GBK|zh_CK.UTF-8|zh_CK.GBK' >> ./logs/lang.log
if [ `cat ./logs/lang.log | wc -l `  -gt 0 ];then
    echo "LANG is error:" >> ./logs/error.log
    cat ./logs/lang.log >> ./logs/error.log
fi
rm -f ./logs/lang.log


cat ./logs/error.log







