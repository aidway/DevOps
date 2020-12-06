#!/bin/sh

#### stop agent
cd /oma/agent12c/bin
./emctl stop agent

#### Move pending files
date=`date +'%Y%m%d'`
cd /oma
mkdir emd_${date}bak
cd emd_${date}bak
mkdir state_$date
mkdir collection_$date
cd /oma/agent12c/sysman/emd/state
mv * /oma/emd_${date}bak/state_$date
cd /oma/agent12c/sysman/emd/collection
mv * /oma/emd_${date}bak/collection_$date

#### Set the following parameter at agent side
cd /oma/agent12c/bin
./emctl setproperty agent -allow_new -name _traceSeverityForTypes -value noTypes
./emctl clearstate agent

#### If on standby database,do not start the oms agent.
if [ `ps -ef | grep ora_smon | wc -l` -gt 1 ];then
	./emctl start agent
fi
./emctl status agent

