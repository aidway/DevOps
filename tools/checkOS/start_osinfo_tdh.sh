#!/bin/sh

[ -d /root/tdhsoft/scripts/osinfo/mem ] || mkdir /root/tdhsoft/scripts/osinfo/mem
[ -d /root/tdhsoft/scripts/osinfo/cpu ] || mkdir /root/tdhsoft/scripts/osinfo/cpu

i=1
MAX_NUM=$(($3 * 86400 / $2 + 1))
while :
do
    ps -aux | sort -k4nr | head -$1 > /root/tdhsoft/scripts/osinfo/mem/memuse.info$i
    ps -aux | sort -k3nr | head -$1 > /root/tdhsoft/scripts/osinfo/cpu/cpuuse.info$i
    sleep $2
    i=$(($i+1))
    if [ $i -gt $MAX_NUM ];then
        i=1
    fi
    #find /root/tdhsoft/scripts/osinfo/cpu/*  -mtime +$3 -print -exec rm {} \; 
    #find /root/tdhsoft/scripts/osinfo/mem/*  -mtime +$3 -print -exec rm {} \;
done


