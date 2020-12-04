#!/bin/sh

for i in `docker ps | grep executor | grep -v pause | awk -F ' ' '{print $1}'`
do
    dockerid=`echo $i`
    jstatid=`docker exec -i $dockerid bash -c jps | grep CoarseGrainedExecutorBackend | awk '{print $1}'`
    docker exec -i $dockerid jstat -gcutil $jstatid
done


