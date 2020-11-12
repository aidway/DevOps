#!/bin/bash

SCRIPT_BASE_PATH=`dirname $0`

source $SCRIPT_BASE_PATH/conf/env.conf

LOCAL_PATH=/home/transwarp/mssad_hedge/docker-script
LOCAL_LOG_PATH=$LOCAL_PATH/log/etl_log
LOCAL_CONF_PATH=$LOCAL_PATH/conf
LOCAL_SCRIPT_PATH=$LOCAL_PATH/mssad_etl

DOCKER_PATH=/app/tdhfiles
DOCKER_LOG_PATH=$DOCKER_PATH/log/etl_log
DOCKER_CONF_PATH=$DOCKER_PATH/conf
DOCKER_SCRIPT_PATH=$DOCKER_PATH/script/mssad_etl

sudo docker run -d  --name $MSSAD_ETL_CONTAINER -v $LOCAL_LOG_PATH:$DOCKER_LOG_PATH -v $LOCAL_CONF_PATH:$DOCKER_CONF_PATH  -v $LOCAL_SCRIPT_PATH:$DOCKER_SCRIPT_PATH       $MSSAD_ETL_IMAGE /bin/bash -c $DOCKER_SCRIPT_PATH/run_etl.sh

