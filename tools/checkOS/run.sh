#!/bin/sh

# -----------------------------------------------------------------------------------------
#
# Filename:    run.sh
# Version:     1.0
# Date:        2017-12-20
# Author:      kwq
# Description: Monitor the top n processes that consume most cpu and memory 
# OS Type:     linux
# Notes:       install pdsh first!
#
# -----------------------------------------------------------------------------------------


# ip info
SERVER_IP=11.1.199.[1-10]
# top n process 
TOP_N=100
# check interval
INTERVAL_SECOND=300
# file reserved time
RESERVE_DAY=10

echo "Remember run cpto.sh first!"

[ $# -ne 1 ] && echo "Usage:sh run.sh [start | stop | ps]" && exit
! [ "$1" = "start" -o "$1" = "stop" -o "$1" = "ps" ] && echo "Usage:sh run.sh [start | stop | ps]" && exit


if [ "$1" = "start" ];then
    pdsh -R ssh -w $SERVER_IP nohup sh /root/tdhsoft/scripts/osinfo/start_osinfo_tdh.sh $TOP_N  $INTERVAL_SECOND $RESERVE_DAY  &
elif [ "$1" = "stop" ];then
    pdsh -R ssh -w $SERVER_IP sh /root/tdhsoft/scripts/osinfo/stop_osinfo_tdh.sh 
elif [ "$1" = "ps" ];then
    pdsh -R ssh -w $SERVER_IP ps -ef | grep start_osinfo_tdh.sh | grep -v grep
else
    echo "Usage:sh run.sh [start | stop | ps]"
fi


