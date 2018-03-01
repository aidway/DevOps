#!/bin/sh

echo '' > uuid.info
df -h | grep disk | awk -F ' ' '{print $1,$6}' > disk.info
cat disk.info | while read i
do
    devs=`echo $i | awk -F ' ' '{print $1}'`
    disks=`echo $i | awk -F ' ' '{print $2}'`
    
    uuid=`blkid $devs |  awk '{print $3}' | sed 's/"//g'`

    echo $uuid $disks ext4 defaults 0 0 >> uuid.info
done
ssduuid=`blkid /dev/nvme0n1p1 |  awk '{print $3}' | sed 's/"//g'`

 
if [ "`hostname`" = "hnnx-dn9" -o "`hostname`" = "hnnx-dn10" ];then
    echo $ssduuid /mnt/ssd1 ext4 defaults 0 0 >> uuid.info
else
    echo $ssduuid /mnt/ssd ext4 defaults 0 0 >> uuid.info
fi

cp /etc/fstab /etc/fstab_20171202bak
sed -i '/ramfs/  r uuid.info' /etc/fstab