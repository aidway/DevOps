-- 1.��¼������־
drop table mssad_db.mssad_etl_log;
create table mssad_db.mssad_etl_log
(
    eskey string             comment 'Ψһ��',
    database_name string     comment '���ݿ�����',
    proc_name string         comment '�洢��������',
    etl_date  string         comment '��������',
    etl_step int             comment '����',
    step_info string         comment '����˵��',
    setp_log string          comment '������־',
    step_start_time string   comment '���迪ʼʱ��',
    setp_end_time string     comment '�������ʱ��',
    step_seconds double      comment '����ʱ������',
    step_record double       comment 'Ӱ���¼����'
)
comment '������־��¼'
stored as es;

-- 2.Դ���¼��
drop table mssad_db.user_tables;
create table mssad_db.user_tables(
    eskey string          comment 'Ψһ����table_name || database_name || system_name',
    table_name string     comment '����',
    database_name string  comment '���ݿ���',
    system_name string    comment 'ϵͳ���',
    table_comment string  comment '��ע'
)
comment 'Դ��������¼��'
stored as es;



