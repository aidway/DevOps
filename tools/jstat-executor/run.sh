#!/bin/sh


# -----------------------------------------------------------------------------------------
#
# Filename:    run.sh
# Version:     1.0
# Date:        2017-11-03
# Author:      kww
# Description: get jstat info of inceptor executor
# OS Type:     linux
# Note:        every host must have /root/tdhsoft/scripts/jstat/jstat.sh 
#
# -----------------------------------------------------------------------------------------

HOSTNAME=hnnx-dn

for ((i=1; i<=6; i++))
do
   pdsh -R ssh -w $HOSTNAME$i  sh /root/tdhsoft/scripts/jstat/jstat.sh 
done



