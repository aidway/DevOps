
#备份 /etc/fstab
cp /etc/fstab /etc/fstab.bak

for DEVICE in $DEVICE_LIST
do
    PARTITION="$DEVICE""1"
#查看磁盘是否挂载，如果挂载，退出
    if (df -h | grep $DEVICE); then 
        echo "This desk already mounted, this task will be interrupted, please reselect the DEVICE_LIST !!!"
        break;
    fi
#查看磁盘是否分区，如果分区，先删除所有分区，再重新分区
    if (fdisk -l | grep $PARTITION); then
        dd if=/dev/zero of=$DEVICE bs=512K count=1
    fi
#分区加格式化磁盘
    echo "+++++create partition for $DEVICE......"
    parted -s $DEVICE mklabel gpt mkpart gpt2t ext2 0% 100%
    echo "+++++formatting $PARTITION......"
    mkfs.ext4 -T largefile $PARTITION
#挂载磁盘
    UUID=`blkid "$PARTITION" | awk '{print $2}' | sed 's/"//g'`
    MOUNTDIR="/mnt/""disk""$dir"
    let dir+=1
    mkdir -p $MOUNTDIR
    echo "+++++appending \"$UUID $MOUNTDIR ext4 defaults 0 0\" to /etc/fstab"
    echo "$UUID $MOUNTDIR ext4 defaults 0 0" >> /etc/fstab
done

#mount all partitions
mount -a
