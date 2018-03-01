#!/bin/bash
# There are some tips in this script:
# 1. OS disk should be sda, and it will not be formatted;
# 2. DATA disk should not be parted;
# 3. disk_size > 1T is regarded as SATA(BIG_DISK), while disk_size < 1T is SSD(SMALL_LIST)
# 4. Disks are mounted with UUID on /mnt/disk[N]. The information is written in /etc/fstab.

SATA_SIZE=1000000000
BIG_LIST=""
SMALL_LIST=""
let i=0

# generate BIG_LIST and SMALL_LIST, BIG_DISK > 1T
for x in $(cat /proc/partitions | grep sd | egrep -v sda | egrep -v "*[0-9]$" | awk '{print $4}');
do
  line=$(cat /proc/partitions | grep sd | egrep ${x} | egrep "*[0-9]$")
  if [ -n "$line" ]; then
    echo "disk $line is parted, skip..."
  fi
  disk_size=$(cat /sys/block/${x}/size)
  if [ $disk_size -le $SATA_SIZE ]; then
    echo "disk $x is ssd. ignore..."
    SMALL_LIST="$SMALL_LIST /dev/$x"
    continue
  fi
  BIG_LIST="$BIG_LIST /dev/$x"
done

DEVICE_LIST="$SMALL_LIST""$BIG_LIST"
echo $DEVICE_LIST

# format SATA disk
for DEVICE in $DEVICE_LIST
do
  echo "+++++create partition for $DEVICE......"
  parted -s $DEVICE mklabel gpt mkpart gpt2t ext2 0% 100%
  #PARTITION="$DEVICE""1"
  PART="$DEVICE"
  echo "+++++formatting $PART......"
  #mkfs.ext4 -T largefile $PART
  mkfs.ext4 $PART -N 20000000
done

cp /etc/fstab /etc/fstab.bak

let j=1

for PARTITION in $DEVICE_LIST
do
  #UUID=`blkid "/dev/""$PARTITION" | awk '{print $2}' | sed 's/\"//g'`
  UUID=`blkid "$PARTITION" | awk '{print $2}' | sed 's/\"//g'`
  echo $UUID

  echo "add $PARTITION to /etc/fstab"
  MOUNTDIR="/mnt/disk""$j"
  echo "mkdir -p $MOUNTDIR"
  mkdir -p $MOUNTDIR

  echo "appending \"$UUID $MOUNTDIR ext4 defaults 0 0\" to /etc/fstab "
  echo "$UUID $MOUNTDIR ext4 defaults 0 0" >> /etc/fstab
  echo "" 
  let j=$j+1
done

#mount all partitions
mount -a

#show mounted partitions
df -h
