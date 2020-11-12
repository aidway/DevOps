!set plsqlUseSlash true

create or replace procedure mssad_db.pro_call_all(i_etl_r_dt in date)
IS
/******************************************************************************
  作业功能: 调用所有存储过程
  过程名称: pro_call_all
  参数解释: i_etl_r_dt  跑批日期 
    版本号: V1.0
    数据库: mssad_db
    目标表: 
      源表: 
    开发者: kwq 
  开发时间: 2020-03-14
  修改日期:
  修改内容:
  用法举例: pro_call_all('2019-12-15')
  调度频率: 每交易日
  
      规范：全部采用小写字母（个别环境设置除外）
            内部变量采用 v_ 开头
            传入变量采用 i_ 开头
            输出变量采用 o_ 开头
******************************************************************************/  

/*********************************变量声明************************************/ 
 
    o_database_nm      varchar2(50) := 'mssad_db';       --库名
    o_pro_nm           varchar2(200) := 'pro_call_all'; --存储过程名       
    o_etl_step         varchar2(100);                  --跑批步骤
    o_step_info        varchar2(200);                  --步骤说明
    o_step_log         varchar2(200);                  --步骤日志
    o_step_starttime   varchar2(200);                  --步骤开始时间
    o_step_endtime     varchar2(200);                  --步骤结束时间
    o_step_recode      varchar2(200);                  --数据量
    o_etl_r_dt           date;                         --跑批日期
	
     
    return_code int ;
 

begin
    
 	
	o_etl_r_dt := i_etl_r_dt;
	


    /************************************日志************************************/ 
    o_etl_step := '00';
    o_step_info := 'begin call all mssad_db proc';
    select to_timestamp(SYSDATE) into o_step_starttime from system.dual;
   /************************************SQL 正文************************************/  
  
    -- 1. 加载个人信息
    mssad_db.pro_sample(o_etl_r_dt);
	 
	

    -----------------------------------记录日志------------------------------------
    o_step_log := SQLERRM();  --日志代码
    o_step_recode := SQL%ROWCOUNT; --数据量
    select to_timestamp(SYSDATE) into o_step_endtime from system.dual;
    mssad_db.pro_write_log(o_database_nm    ,
                     o_pro_nm         ,
                     o_etl_r_dt         ,
                     o_etl_step       ,
                     o_step_info      ,
                     o_step_log       ,
                     o_step_starttime ,
                     o_step_endtime   ,
                     o_step_recode  
                    );

                    
    exception
        when others then
            raise;
end;