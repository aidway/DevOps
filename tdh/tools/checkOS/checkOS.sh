#!/bin/sh

# -----------------------------------------------------------------------------------------
#
# Filename:    run.sh
# Version:     1.0
# Date:        2018-01-15
# Author:      kwq
# Description: Check os info,include cpu、memory、disk
# OS Type:     linux
#
# -----------------------------------------------------------------------------------------


# cpu 1680
cpu_vcores=`pdsh -R ssh -w 11.1.110.[1-42] cat /proc/cpuinfo | grep "processor" | sort | uniq | grep -v "^$" | wc -l`
expected_cpu_vcores=1680

# 内存 42
memory_num=`pdsh -R ssh -w 11.1.110.[1-42] cat /proc/meminfo | grep -i MemTotal | grep 330092784 | grep -v "^$"  | wc -l`
expected_memory_num=42

# 硬盘 252
disk_num=`pdsh -R ssh -w 11.1.110.[1-42] df -h | grep /dev/sd | grep -v boot | grep 3.7 | grep -v "^$"  | wc -l`
expected_disk_num=252

result=1
if [ $cpu_vcores -ne $expected_cpu_vcores ];then
    echo "Cpu vcores: expected $expected_cpu_vcores, actual $cpu_vcores,please check."
    result=0
fi

if [ $memory_num -ne $expected_memory_num ];then
    echo "Memory nums:expected $expected_memory_num, actual $memory_num, please check."
    result=0
fi

if [ $disk_num -ne $expected_disk_num ];then
    echo "Disk nums:expected $expected_disk_num, actual $disk_num, please check."
    result=0
fi

[ $result -eq 1 ] && echo "All are healthy."

