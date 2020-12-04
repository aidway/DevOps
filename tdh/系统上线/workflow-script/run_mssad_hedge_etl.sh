#!/bin/bash

SCRIPT_BASE_PATH=`dirname $0`


## 1.加载配置文件
source $SCRIPT_BASE_PATH/inceptor.conf
source $BASH_PROFILE_PATH
source $TDH_CLIENT_PATH


if [  $# -ne 1 ];then
    echo `date` 'Error:time flag(PZ/AC/NA) need to input.' >> $SCRIPT_BASE_PATH/error.log
    exit 1
fi


LOG_BASE_PATH=`echo $SCRIPT_BASE_PATH`
if [ $1 == 'PZ' ];then
    # 盘中
    LOG_PATH=$LOG_BASE_PATH/log/hedge_log_pz
    RPT_KEY=PZ_HEDGE_RPT
    FEATURE_STATUS=\"PZ_DATA\"
elif [ $1 == 'AC' ];then
    # 盘后
    LOG_PATH=$LOG_BASE_PATH/log/hedge_log_ac
    RPT_KEY=AC_HEDGE_RPT
    FEATURE_STATUS=\"AC_DATA\"
elif [ $1 == 'NA' ];then
    # 夜盘
    LOG_PATH=$LOG_BASE_PATH/log/hedge_log_na
    RPT_KEY=NA_HEDGE_RPT
    FEATURE_STATUS=\"NA_DATA\"
else
    echo `date` 'Time flag error: only support PZ/AC/NA' >> $SCRIPT_BASE_PATH/error.log
    exit 1
fi
if ! [ -d $LOG_PATH ];then
    mkdir -p $LOG_PATH
fi

## 2. 查询交易日
trade_date=`beeline  --outputformat=csv --showHeader=false --verbose=false --silent=true -u  jdbc:hive2://${INCEPTOR_SERVER}:10000/${INCEPTOR_DB} -n ${INCEPTOR_USERNAME} -p ${INCEPTOR_PASSWORD}  -e "select today from dtl_db.dtl_trade_date" 2>/dev/null  | awk 'END{print}'  `

echo `date` '当前交易日:' $trade_date >> $LOG_PATH/run.log
if [ "$trade_date" == "" ];then
    echo `date` 'Error: trade_date is null.' >> $LOG_PATH/run.log
    exit 1
fi


## 3. 执行
run=1
i=1
while [ $run -eq 1 ]
do
    cnt=`beeline  --outputformat=csv --showHeader=false --verbose=false --silent=true -u  jdbc:hive2://${INCEPTOR_SERVER}:10000/${INCEPTOR_DB} -n ${INCEPTOR_USERNAME} -p ${INCEPTOR_PASSWORD} -e "select count(*) from amkt_db.mkt_rpt_finish_status where trade_date=${trade_date} and rpt_key='${RPT_KEY}' and status='Y' " 2>/dev/null  | awk 'END{print}'`
    cnt=`echo $cnt |  sed 's/"//g'`

    if [ $cnt -gt 0 ];then
        beeline -u jdbc:hive2://${INCEPTOR_SERVER}:10000/${INCEPTOR_DB} -n ${INCEPTOR_USERNAME} -p ${INCEPTOR_PASSWORD} -e "call mssad_db.pro_load_hedge_call_all_proc(${trade_date})"
        echo `date` '前端ETL脚本执行成功'  >> $LOG_PATH/run.log
        beeline -u jdbc:hive2://${INCEPTOR_SERVER}:10000/${INCEPTOR_DB} -n ${INCEPTOR_USERNAME} -p ${INCEPTOR_PASSWORD} -e "call mssad_db.pro_load_hedge_recommend_call_all_proc(${trade_date}, ${trade_date}, ${FEATURE_STATUS} )"
        echo `date` '特征ETL执行成功'  >> $LOG_PATH/run.log
        run=0
        exit 0
    fi
    i=$(($i+1))
    if [ $i -gt 50 ];then
        exit 1
        echo `date` '数据条件不满足，脚本退出执行' >> $LOG_PATH/run.log
    fi
    sleep 300
done




