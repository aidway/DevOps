#!/bin/sh

# pdsh -w 11.1.199.[1-10] mkdir -p $DESTDIR
DEST_DIR=/root/tdhsoft/scripts/jstat


for IP in `cat ip.list`
do
    scp *.sh $IP:$DEST_DIR
done






