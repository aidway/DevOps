#!/bin/bash
# There are some tips in this script:
# 1. OS disk should be sda, and it will not be formatted;
# 2. DATA disk should not be parted;
# 3. disk_size > 1T (DISK_SIZE=2000000000) is regarded as data disk(BIG_LIST), while disk_size < 1T is regarded as other(SMALL_LIST)
# 4. Disks are formated as ext4, with 20000000 inodes per disk.
# 5. Disks are mounted with UUID on /mnt/disk[N]. The information is written in /etc/fstab.

# DISK_SIZE=2000000000, equal to 1T
DISK_SIZE=2000000000
BIG_LIST=""
SMALL_LIST=""

# generate BIG_LIST and SMALL_LIST
for x in $(cat /proc/partitions | grep sd | egrep -v sda | egrep -v "*[0-9]$" | awk '{print $4}');
do
  line=$(cat /proc/partitions | grep sd | egrep ${x} | egrep "*[0-9]$")
  if [ -n "$line" ]; then
    echo "disk $line is parted, skip..."
  fi
  disk_size=$(cat /sys/block/${x}/size)
  if [ $disk_size -le $DISK_SIZE ]; then
    echo "disk $x is other. ignore..."
    SMALL_LIST="$SMALL_LIST /dev/$x"
    continue
  fi
  BIG_LIST="$BIG_LIST /dev/$x"
done

# define the data disk list 
# DEVICE_LIST="$BIG_LIST""$SMALL_LIST"
DEVICE_LIST="$BIG_LIST"
echo $DEVICE_LIST

# format SATA disk
for DEVICE in $DEVICE_LIST
do
  echo "++++++ create partition for $DEVICE......"
  parted -s $DEVICE mklabel gpt mkpart gpt2t ext2 0% 100%
  PART="$DEVICE""1"
  echo "++++++++++++formatting $PART......"
  #format disk as ext4, with 20000000 inodes
  mkfs.ext4 $PART -N 20000000
done

cp /etc/fstab /etc/fstab.bak

let j=1

for PARTITION in $DEVICE_LIST
do
  UUID=`blkid "$PARTITION""1" | awk '{print $2}' | sed 's/\"//g'`
  echo $UUID

  echo "++++++ adding $PARTITION to /etc/fstab"
  MOUNTDIR="/mnt/disk""$j"
  echo "++++++ creating directory $MOUNTDIR"
  mkdir -p $MOUNTDIR

  echo "++++++ appending \"$UUID $MOUNTDIR ext4 defaults 0 0\" to /etc/fstab "
  echo "$UUID $MOUNTDIR ext4 defaults 0 0" >> /etc/fstab
  echo "" 
  let j=$j+1
done

#mount all partitions
mount -a

#show mounted partitions
df -h
