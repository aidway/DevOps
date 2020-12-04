#!/bin/sh
ps -ef | grep start_osinfo_tdh.sh | grep -v grep | awk '{print $2}'| xargs kill -9

