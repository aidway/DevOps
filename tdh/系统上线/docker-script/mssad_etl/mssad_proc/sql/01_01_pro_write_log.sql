!set plsqlUseSlash true

create or replace procedure mssad_db.pro_write_log(i_database_nm    in string,
                                                 i_pro_nm         in string,
                                                 i_etl_dt         in string,
                                                 i_etl_step       in int,
                                                 i_step_info      in string,
                                                 i_step_log       in string,
                                                 i_step_starttime in string,
                                                 i_step_endtime   in string,
                                                 i_step_recode    in double
                                                 ) is
/********************************************************************
  作业功能：记录跑批日志
    版本号：V1.0
    
    目标表：mssad_db.etl_log
      源表：
    开发者：hdp
  开发时间：2019-12-25
  修改日期：
  修改内容：
  
      规范：全部采用小写字母（个别环境设置除外）
            内部变量采用 o_ 开头
            传入变量采用 i_ 开头
            输出变量采用 o_ 开头
********************************************************************/ 
v_id  varchar2(200);   
               
/************************************SQL 正文************************************/ 
begin
set_env('esdrive.insert.without.rowkey','true');


v_id := to_timestamp(sysdate);

execute immediate ("insert into mssad_db.mssad_etl_log(
                               key,
							   database_nm    ,  --库名
                               pro_nm         ,  --存储过程名
                               etl_dt         ,  --跑批日期
                               etl_step       ,  --步骤
                               step_info      ,  --步骤说明
                               step_log       ,  --步骤日志
                               step_starttime ,  --步骤开始时间
                               step_endtime   ,  --步骤结束时间
							   step_seconds      ,  --步骤运行时间
                               step_recode       --影响记录条数
                               )
                        values('"||v_id||"'    ,
						       '"||i_database_nm||"'    ,
                               '"||i_pro_nm||"'         ,
                               '"||i_etl_dt||"'         ,
                               "||i_etl_step||"       ,
                               '"||i_step_info||"'      ,
                               '"||i_step_log||"'       ,
                               to_char(from_unixtime("||i_step_starttime||")) ,
                               to_char(from_unixtime("||i_step_endtime||"))   ,
							   ("||i_step_endtime||"- "||i_step_starttime||")   ,
                               "||i_step_recode||"
                               );");
  exception
    when others then
      raise;
  end;
