create table parent_t 
( 
parent_id integer not null, 
parent_name varchar2(30) null, 
constraint parent_t_pk primary key (parent_id) 
); 

create table child_t 
( 
child_id integer not null, 
parent_id integer null, 
child_name varchar2(30) null, 
constraint child_t_pk primary key (child_id), 
constraint parent_id_fk foreign key (parent_id) references parent_t (parent_id) 
); 

create index idx_child_t_parent_id on child_t(parent_id); 

insert into parent_t select level, 'test_parent_'||level from dual connect by level select instance_number from v$instance; 

INSTANCE_NUMBER 
--------------- 
2 

SQL> select * from v$mystat where rownum=1; 

SID STATISTIC# VALUE 
---------- ---------- ---------- 
148 0 0 

SQL> delete child_t where child_id=1; 

1 row deleted. 

2. �¿���һ��session�۲�session A�ϳ��е����� 

select * from gv$lock where inst_id=2 and sid=148 

INST_ID SID TYPE ID1 ID2 LMODE REQUEST CTIME BLOCK 
2 148 TM 87420 0 3 0 45 2 
2 148 TX 786440 9 6 0 45 2 
2 148 TM 87422 0 3 0 45 2 
2 148 AE 100 0 4 0 83 2 

�۲����ϵ�TM�����ָ�SQL���ڸ�����ӱ��ϳ���mode=3��TM����Ҳ����ͨ��gv$locked_object��dba_objects��һ����֤: 

select * from gv$locked_object where inst_id=2 and session_id=148; 

INST_ID XIDUSN XIDSLOT XIDSQN OBJECT_ID SESSION_ID LOCKED_MODE 
2 12 8 9 87420 148 3 
2 12 8 9 87422 148 3 

select object_id,object_name from dba_objects where object_id in (87420,87422); 

OBJECT_ID OBJECT_NAME 
87420 PARENT_T 
87422 CHILD_T 

ͬʱSession A ����mode 6ģʽ����id1=786440 id2=9��TX��,����۲�һ��id1=786440 id2=9��TX�� 

select trunc(786440 / power(2, 16)) xidusn, bitand(786440, to_number('ffff', 'xxxx')) xidslot, 9 xidsqn from dual; 

XIDUSN XIDSLOT XIDSQN 
12 8 9 
��֪�������XIDUSN/XIDSLOT/XIDSQNΪ12,8,9 

3. ����Session B: 

SQL> select instance_number from v$instance; 

INSTANCE_NUMBER 
--------------- 
1 

SQL> select * from v$mystat where rownum=1; 

SID STATISTIC# VALUE 
---------- ---------- ---------- 
154 0 0 

SQL> delete parent_t where parent_id=1; 
--hang 

4. ��ѯsession B��������� 

select * from gv$lock where inst_id=1 and sid=154; 

INST_ID SID TYPE ID1 ID2 LMODE REQUEST BLOCK 
1 154 TX 786440 9 0 4 0 
1 154 AE 100 0 4 0 2 
1 154 TM 87420 0 3 0 2 
1 154 TX 262167 681 6 0 2 
1 154 TM 87422 0 3 0 2 


��֪Session B�ɹ��Ļ�ȡ�������ӱ�͸����ϵ�TM=3���������ҳɹ���mode 6ģʽ������id1=262167 id2=681��TX�� 
select trunc(262167 / power(2, 16)) xidusn, bitand(262167, to_number('ffff', 'xxxx')) xidslot, 681 xidsqn from dual; 

XIDUSN XIDSLOT XIDSQN 
4 23 681 

��֪�������XIDUSN/XIDSLOT/XIDSQNΪ4,23,681 

����Session B�ڳ�����mode 4�������id1=786440 id2=9 (12,8,9) ��TX����ʱ������������ 

INST_ID SID TYPE ID1 ID2 LMODE REQUEST BLOCK 
1 154 TX 786440 9 0 4 0 

5. Ȼ����Session A��ִ�У� 

insert into child_t values (1,1,'test_child_1'); 
Ѹ�ٲ�ѯ��������� 

select * from gv$lock where inst_id=2 and sid=148; 

INST_ID SID TYPE ID1 ID2 LMODE REQUEST BLOCK 
2 148 TM 87420 0 3 0 2 
2 148 TX 786440 9 6 0 2 
2 148 TM 87422 0 3 0 2 
2 148 AE 100 0 4 0 2 
2 148 TX 262167 681 0 4 0 

��֪Session A��ʱ�ֳ�����mode 4ģʽ����ȡ id1=262167 id2=681 (4,23,681)�ϵ�TX��������session B��mode 6���У� 
������ڵ�����ǣ� 

Session A: ��mode 6��������XIDUSN/XIDSLOT/XIDSQNΪ12,8,9��TX������Ҫ��mode 4��ȡXIDUSN/XIDSLOT/XIDSQNΪ4,23,681��TX�� 
Session B: ��mode 6��������XIDUSN/XIDSLOT/XIDSQNΪ4,23,681��TX������Ҫ��mode 4��ȡXIDUSN/XIDSLOT/XIDSQNΪ12,8,9��TX�� 

����Session A��Session B deadlock�ˣ� 

ERROR at line 1: 
ORA-00060: deadlock detected while waiting for resource 

����mode 4 / 6 �ĺ��壬�ο�: 

http://docs.oracle.com/cd/E11882_01/server.112/e40402/dynviews_2027.htm#REFRN30121 




