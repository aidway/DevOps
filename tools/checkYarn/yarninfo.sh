#!/bin/sh

[ -d /root/tdhsoft/scripts/yarn/nodelist ] || mkdir /root/tdhsoft/scripts/yarn/nodelist


i=1
while :
do
    yarn node -list > /root/tdhsoft/scripts/yarn/nodelist/yarnnode.info$i 2>/dev/null
    sleep 300
    i=$(($i+1))
    if [ $i -gt 288 ];then
        i=1
    fi
done