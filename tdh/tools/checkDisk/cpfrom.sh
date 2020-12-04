
#!/bin/sh

for ((i=1;i<=9;i++))
do
    hostname=hnnxdn00$i
    scp $hostname:/tmp/$hostname.info /root/tdhsoft/scripts/diskCheck/all
done
for ((i=10;i<=42;i++))
do
    hostname=hnnxdn0$i
    scp $hostname:/tmp/$hostname.info /root/tdhsoft/scripts/diskCheck/all
done

