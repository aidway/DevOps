insert into bucket_size  
select dbname,
       username,
       tbname,
       partition_name,
       max(bucket_size) max_size_bytes,
       min(bucket_size) min_size_bytes,
       case when min(bucket_size)==0 then 999999 else round(max(bucket_size)/min(bucket_size)) end ratio,
       sysdate
  from (select replace(dbname, '.db', '') dbname,
               username,
               tbname,
               partition_name,
               bucket_name,
               sum(bytes) bucket_size
          from bucket_size_txt
         group by dbname, username, tbname, partition_name, bucket_name
         order by dbname, username, tbname, partition_name, bucket_name)
 group by dbname, username, tbname, partition_name;


/*
drop table default.bucket_size_txt;
create  table default.bucket_size_txt(
dbname string,
username string,
tbname string,
partition_name string,
base_name string, 
bucket_name string,
bytes number(38,0)
) 
row format delimited fields terminated by ',' 
location '/tmp/bucket_size_txt';

drop  table default.bucket_size;
create table default.bucket_size(
dbname string,
username string,
tbname string,
partition_name string,
max_size_bytes number(38,0),
min_size_bytes number(38,0),
ratio number(38,0), 
last_analyzed timestamp) 
clustered by (dbname) into 11 buckets 
stored as orc 
tblproperties ("transactional"="true");

*/


 
 
 
 
 