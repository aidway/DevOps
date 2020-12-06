删除分区后索引还存在
新加的分区也可以没有索引

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
     

--------------------- 创建global索引       
CREATE INDEX cost_ix ON sales (amount_sold)
   GLOBAL PARTITION BY RANGE (amount_sold)
      (PARTITION p1 VALUES LESS THAN (1000),
       PARTITION p2 VALUES LESS THAN (2500),
       PARTITION p3 VALUES LESS THAN (MAXVALUE));
       
select * from dba_indexes s where s.index_name='COST_IX';        
select * from dba_part_indexes s where s.index_name='COST_IX';  
-- 查看索引状态     
select *
  from dba_ind_partitions
 where index_name = 'COST_IX';
 
 
-- 分区改名
alter table sales rename partition p3 to p100;  
alter index  cost_ix rename partition p3 to p100;
 
 
-- 删除分区：global索引变为UNUSABLE
alter table sales drop partition p2 ; 

-- 添加一个分区
alter table sales add partition p4 VALUES LESS THAN (6000);
 
-- 重新rebuild分区索引
alter index cost_ix rebuild partition p4; 
 
 
-- 子分区 
dba_ind_subpartitions 
 
 
 
 
       
       
 -- 创建分区表 
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
  
     
-------------------- 创建local index       
CREATE INDEX cost_ix ON sales (amount_sold)
   LOCAL  
      (PARTITION p1 ,
       PARTITION p2 ,
       PARTITION p3 );
         
       
       
       
 -- 区间分区
create table range_example (range_key_value number)
partition by range (range_key_value)
(
   partition p1 values less than (1000),
   partition p2 values less than (2000),
   partition p3 values less than (maxvalue)
);

-- 散列分区
create table hash_example
(hash_key_value id number)
partition by hash(hash_key_value)
(
    partition p1 tablespace t1,
    partition p2 tablespace t2
);

       
       
  
       
       
