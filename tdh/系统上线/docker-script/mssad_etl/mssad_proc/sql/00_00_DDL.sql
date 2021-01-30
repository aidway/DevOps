-- 1.记录跑批日志
drop table mssad_db.mssad_etl_log;
create table mssad_db.mssad_etl_log
(
    eskey string             comment '唯一键',
    database_name string     comment '数据库名称',
    proc_name string         comment '存储过程名称',
    etl_date  string         comment '跑批日期',
    etl_step int             comment '步骤',
    step_info string         comment '步骤说明',
    setp_log string          comment '步骤日志',
    step_start_time string   comment '步骤开始时间',
    setp_end_time string     comment '步骤结束时间',
    step_seconds double      comment '运行时长，秒',
    step_record double       comment '影响记录条数'
)
comment '跑批日志记录'
stored as es;

-- 2.源表记录表
drop table mssad_db.user_tables;
create table mssad_db.user_tables(
    eskey string          comment '唯一键：table_name || database_name || system_name',
    table_name string     comment '表名',
    database_name string  comment '数据库名',
    system_name string    comment '系统简称',
    table_comment string  comment '备注'
)
comment '源表依赖记录表'
stored as es;



