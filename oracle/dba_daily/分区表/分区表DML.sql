ɾ������������������
�¼ӵķ���Ҳ����û������

CREATE table sales (amount_sold number)
    PARTITION BY RANGE (amount_sold)
      (PARTITION p1 VALUES LESS THAN (1000),
       PARTITION p2 VALUES LESS THAN (2500),
       PARTITION p3 VALUES LESS THAN (5000));

  select * from dba_segments s where s.segment_name='SALES';   
  select * from sales;    
  insert into sales values(1000);   
  insert into sales values(2000);  
  insert into sales values(3000);  
  insert into sales values(5000);  
     

--------------------- ����global����       
CREATE INDEX cost_ix ON sales (amount_sold)
   GLOBAL PARTITION BY RANGE (amount_sold)
      (PARTITION p1 VALUES LESS THAN (1000),
       PARTITION p2 VALUES LESS THAN (2500),
       PARTITION p3 VALUES LESS THAN (MAXVALUE));
       
select * from dba_indexes s where s.index_name='COST_IX';        
select * from dba_part_indexes s where s.index_name='COST_IX';  
-- �鿴����״̬     
select *
  from dba_ind_partitions
 where index_name = 'COST_IX';
 
 
-- ��������
alter table sales rename partition p3 to p100;  
alter index  cost_ix rename partition p3 to p100;
 
 
-- ɾ��������global������ΪUNUSABLE
alter table sales drop partition p2 ; 

-- ���һ������
alter table sales add partition p4 VALUES LESS THAN (6000);
 
-- ����rebuild��������
alter index cost_ix rebuild partition p4; 
 
 
-- �ӷ��� 
dba_ind_subpartitions 
 
 
 
 
       
       
 -- ���������� 
CREATE table sales (amount_sold number)
    PARTITION BY RANGE (amount_sold)
      (PARTITION p1 VALUES LESS THAN (1000),
       PARTITION p2 VALUES LESS THAN (2500),
       PARTITION p3 VALUES LESS THAN (5000));

  select * from dba_segments s where s.segment_name='SALES';   
  select * from sales;    
  insert into sales values(1000);   
  insert into sales values(2000);  
  insert into sales values(3000);  
  insert into sales values(5000);  
  
     
-------------------- ����local index       
CREATE INDEX cost_ix ON sales (amount_sold)
   LOCAL  
      (PARTITION p1 ,
       PARTITION p2 ,
       PARTITION p3 );
         
       
       
       
 -- �������
create table range_example (range_key_value number)
partition by range (range_key_value)
(
   partition p1 values less than (1000),
   partition p2 values less than (2000),
   partition p3 values less than (maxvalue)
);

-- ɢ�з���
create table hash_example
(hash_key_value id number)
partition by hash(hash_key_value)
(
    partition p1 tablespace t1,
    partition p2 tablespace t2
);

       
       
  
       
       
