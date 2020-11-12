#!/bin/sh


pdsh -R ssh -w hnnxdn0[01-42] sh /root/tdhsoft/scripts/diskCheck/run.sh
rm -f /root/tdhsoft/scripts/diskCheck/all/*.info
sh cpfrom.sh
