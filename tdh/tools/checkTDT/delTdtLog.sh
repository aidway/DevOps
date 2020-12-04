#!/bin/sh

# -----------------------------------------------------------------------------------------
#
# Filename:    run.sh
# Version:     1.0
# Date:        2018-05-29
# Author:      kwq
# Description: delete tdt log 30 days ago.
# OS Type:     linux
# TDH:         5.x & kerberos
#
# -----------------------------------------------------------------------------------------



source ~/.bash_profile

kinit hdfs<<EOF
Bigdata369
EOF

RESERVED_DAYS=30
day_before=`date -d "-$RESERVED_DAYS days" +%Y-%m-%d`


hadoop fs -ls /tdt/log   | grep -v Found | grep -v current | awk -F ' ' '{if ($6<cur_date) print "hadoop fs -rm -r -f -skipTrash " $8}' cur_date="$day_before" > ./rm.sh
sh ./rm.sh
