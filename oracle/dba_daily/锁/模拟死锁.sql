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

2. 新开启一个session观察session A上持有的锁： 

select * from gv$lock where inst_id=2 and sid=148 

INST_ID SID TYPE ID1 ID2 LMODE REQUEST CTIME BLOCK 
2 148 TM 87420 0 3 0 45 2 
2 148 TX 786440 9 6 0 45 2 
2 148 TM 87422 0 3 0 45 2 
2 148 AE 100 0 4 0 83 2 

观察以上的TM，发现该SQL会在父表和子表上持有mode=3的TM锁，也可以通过gv$locked_object和dba_objects进一步验证: 

select * from gv$locked_object where inst_id=2 and session_id=148; 

INST_ID XIDUSN XIDSLOT XIDSQN OBJECT_ID SESSION_ID LOCKED_MODE 
2 12 8 9 87420 148 3 
2 12 8 9 87422 148 3 

select object_id,object_name from dba_objects where object_id in (87420,87422); 

OBJECT_ID OBJECT_NAME 
87420 PARENT_T 
87422 CHILD_T 

同时Session A 会以mode 6模式持有id1=786440 id2=9的TX锁,下面观察一下id1=786440 id2=9的TX锁 

select trunc(786440 / power(2, 16)) xidusn, bitand(786440, to_number('ffff', 'xxxx')) xidslot, 9 xidsqn from dual; 

XIDUSN XIDSLOT XIDSQN 
12 8 9 
可知该事务的XIDUSN/XIDSLOT/XIDSQN为12,8,9 

3. 开启Session B: 

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

4. 查询session B的锁情况： 

select * from gv$lock where inst_id=1 and sid=154; 

INST_ID SID TYPE ID1 ID2 LMODE REQUEST BLOCK 
1 154 TX 786440 9 0 4 0 
1 154 AE 100 0 4 0 2 
1 154 TM 87420 0 3 0 2 
1 154 TX 262167 681 6 0 2 
1 154 TM 87422 0 3 0 2 


可知Session B成功的获取到了在子表和父表上的TM=3的锁，并且成功以mode 6模式持有了id1=262167 id2=681的TX锁 
select trunc(262167 / power(2, 16)) xidusn, bitand(262167, to_number('ffff', 'xxxx')) xidslot, 681 xidsqn from dual; 

XIDUSN XIDSLOT XIDSQN 
4 23 681 

可知该事务的XIDUSN/XIDSLOT/XIDSQN为4,23,681 

但是Session B在尝试以mode 4申请持有id1=786440 id2=9 (12,8,9) 的TX的锁时产生了阻塞： 

INST_ID SID TYPE ID1 ID2 LMODE REQUEST BLOCK 
1 154 TX 786440 9 0 4 0 

5. 然后在Session A上执行： 

insert into child_t values (1,1,'test_child_1'); 
迅速查询其锁情况： 

select * from gv$lock where inst_id=2 and sid=148; 

INST_ID SID TYPE ID1 ID2 LMODE REQUEST BLOCK 
2 148 TM 87420 0 3 0 2 
2 148 TX 786440 9 6 0 2 
2 148 TM 87422 0 3 0 2 
2 148 AE 100 0 4 0 2 
2 148 TX 262167 681 0 4 0 

可知Session A此时又尝试以mode 4模式来获取 id1=262167 id2=681 (4,23,681)上的TX锁，它被session B以mode 6持有， 
因此现在的情况是： 

Session A: 以mode 6持有事务XIDUSN/XIDSLOT/XIDSQN为12,8,9的TX锁，需要以mode 4获取XIDUSN/XIDSLOT/XIDSQN为4,23,681的TX锁 
Session B: 以mode 6持有事务XIDUSN/XIDSLOT/XIDSQN为4,23,681的TX锁，需要以mode 4获取XIDUSN/XIDSLOT/XIDSQN为12,8,9的TX锁 

于是Session A和Session B deadlock了： 

ERROR at line 1: 
ORA-00060: deadlock detected while waiting for resource 

关于mode 4 / 6 的含义，参考: 

http://docs.oracle.com/cd/E11882_01/server.112/e40402/dynviews_2027.htm#REFRN30121 




