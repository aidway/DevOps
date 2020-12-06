-- 从sysman用户往kwq用户添加数据
insert into mgmt$metric_details
  (KEY_VALUE, VALUE, COLLECTION_TIMESTAMP)
  select tablespace_name, pctused, collection_timestamp from sysman.t3;

select TARGET_NAME, KEY_VALUE, VALUE, COLLECTION_TIMESTAMP
  from mgmt$metric_details
 where rownum = 1;

update mgmt$metric_details set TARGET_NAME = 'SMDB_BL860176_oms';

insert into MGMT$DB_DBNINSTANCEINFO values ('SMDB_BL860176_oms', 'SMDB');

update mgmt$metric_details a
   set target_type    = 'oracle_database',
       a.metric_label = 'Tablespaces Full',
       a.column_label = 'Tablespace Space Used (%)';



select count(*)
  from mgmt$metric_details a, mgmt$metric_details b
 where a.target_name = b.target_name
   and a.key_value = b.key_value
   and a.target_name like 'fts%'
   and a.target_type = 'oracle_database'
   and a.metric_label = 'Tablespaces Full'
   and a.column_label = 'Tablespace Space Used (%)'
   and a.collection_timestamp>sysdate -0.1
   ;


-- 查询x、y
select a.target_name,
       a.key_value,
       a.collection_timestamp,
       a.collection_timestamp-to_date('2015-03-10 11:24:32','yyyy-mm-dd hh24:mi:ss')+10 x,
       a.value y
  from mgmt$metric_details a
 where a.target_type = 'oracle_database'
   and a.metric_label = 'Tablespaces Full'
   and a.column_label = 'Tablespace Space Used (%)'
   and a.collection_timestamp > to_date('2015-03-10 11:24:32','yyyy-mm-dd hh24:mi:ss') - 10
   and target_name like 'SMDB%'
   and key_value = 'UNDOTBS1'
 order by a.collection_timestamp-to_date('2015-03-10 11:24:32','yyyy-mm-dd hh24:mi:ss') asc;

select x, y
  from (select a.tablespace_name,
               (select (a.collection_timestamp - min(b.collection_timestamp))
                  from t4 b
                 where a.tablespace_name = b.tablespace_name) x,
               a.pctused y
          from t4 a)
 where tablespace_name = 'TB_CEBQYNJ'
 order by x asc;


-- 查询除数为0
select tablespace_name,
       n * sum_xx - power(sum_x, 2),
       (sqrt(sum_xx - 2 * avg_x * sum_x + n * power(avg_x, 2)) *
       sqrt(sum_yy - 2 * avg_y * sum_y + n * power(avg_y, 2)))
  from (select tablespace_name,
               sum(x * y) sum_xy,
               sum(x) sum_x,
               sum(y) sum_y,
               sum(x * x) sum_xx,
               sum(y * y) sum_yy,
               avg(x) avg_x,
               avg(y) avg_y,
               count(*) n,
               0 a,
               0 b,
               0 r
          from (select a.tablespace_name,
                       (select (a.collection_timestamp -
                               min(b.collection_timestamp)) * 24
                          from t1 b
                         where a.tablespace_name = b.tablespace_name) x,
                       a.pctused y
                  from t1 a)
         group by tablespace_name);


-- 更改收集时间
select target_name,
       key_value,
       max(collection_timestamp),
       min(collection_timestamp)
  from mgmt$metric_details
 group by target_name, key_value;

update mgmt$metric_details
   set collection_timestamp = collection_timestamp + 4
 where target_name like 'SMDB%';
