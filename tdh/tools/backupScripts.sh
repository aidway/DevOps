#!/bin/bash

# -----------------------------------------------------------------------------------------
#
# Filename:    run.sh
# Version:     1.0
# Date:        2018-01-15
# Author:      kwq
# Description: Backup /root/tdhsoft/scripts
# OS Type:     linux
#   
# crontab      0 0 * * * sh /root/tdhsoft/scripts/backupScripts.sh > /tmp/backupScripts.log 2>&1
#
# -----------------------------------------------------------------------------------------

DEST_SERVER=11.1.199.2
DEST_DIR=/root/tdhsoft/backup_scripts

## create backup directory
pdsh -R ssh -w $DEST_SERVER ls $DEST_DIR > ./backupScripts.tmp 2>&1
if [ `cat ./backupScripts.tmp | grep "No such file or directory" | wc -l` -eq 1 ];then
    pdsh -R ssh -w $DEST_SERVER mkdir $DEST_DIR
fi
rm -f ./backupScripts.tmp


scp -r /root/tdhsoft/scripts/* $DEST_SERVER:$DEST_DIR/

 

