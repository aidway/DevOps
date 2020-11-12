#!/bin/sh

## 1. User-defined variables

#### 1.1 the script to execute
USER_PYFILE=/var/log/discover1/test/test4.py
IMPORT_LIBRARYS=/var/log/discover1/test/librarys.zip

#### 1.2 yarn resource allocation
NUM_EXECUTORS=4 
DRIVER_MEMORY=4G 
EXECUTOR_CORES=2
EXECUTOR_MEMORY=6G

#### 1.3 spark 
NAME=test_pyspark

#### 1.4 kerberos
KEYTAB=/var/log/discover1/test/admin.keytab
PRINCIPAL=admin@TDH



## 2. spark submit
DOCKERID=`docker ps | grep notebook | grep -v pause | awk -F ' ' '{print $1}'`

#### LD_LIBRARY的环境变量要加入到spark-submit
docker exec -i $DOCKERID /usr/lib/discover/bin/spark-submit \
--master yarn \
--deploy-mode client \
--name $NAME \
--num-executors $NUM_EXECUTORS \
--driver-memory $DRIVER_MEMORY \
--executor-cores $EXECUTOR_CORES \
--executor-memory $EXECUTOR_MEMORY \
--conf "spark.pyspark.driver.python=/usr/local/bin/python3" \
--conf "spark.pyspark.python=/usr/local/bin/python3" \
--conf "spark.yarn.keytab=$KEYTAB" \
--conf "spark.yarn.principal=$PRINCIPAL" \
--conf "spark.yarn.executor.memoryOverhead=1000M" \
--conf "spark.executor.extraJavaOptions=-Xss8192k" \
--py-files $IMPORT_LIBRARYS $USER_PYFILE


 
 
 
 