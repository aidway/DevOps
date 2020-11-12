#!/bin/sh


# -----------------------------------------------------------------------------------------
#
# Filename:    run.sh
# Version:     1.0
# Date:        2017-11-11
# Author:      kww
# Description: Oracle DDL to TDH DDL(txt/hyperdrive/es/orc/holodesk/insert)
# OS Type:     linux/hp-ux
# Notes:       Run the script by the user which start the instance,default is oracle 
#
# -----------------------------------------------------------------------------------------



hostname=`hostname`
echo '' > /tmp/$hostname.info

hdparm -Tt /dev/sda1 >> /tmp/$hostname.info
hdparm -Tt /dev/sdb1 >> /tmp/$hostname.info
hdparm -Tt /dev/sdc1 >> /tmp/$hostname.info
hdparm -Tt /dev/sdd1 >> /tmp/$hostname.info
hdparm -Tt /dev/sde1 >> /tmp/$hostname.info
hdparm -Tt /dev/sdf1 >> /tmp/$hostname.info
hdparm -Tt /dev/nvme0n1p1  >> /tmp/$hostname.info

