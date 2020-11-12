--truncate table etl.tbsize;
insert into tbsize  select dbname,username,tbname,bytes,sysdate from tbsize_txt;




/*
drop  table tbsize;
create table tbsize(dbname string,username string,tbname string,bytes number(38,0),last_analyzed timestamp) 
clustered by (dbname) into 11 buckets 
stored as orc 
tblproperties ("transactional"="true");

create table tbsize_txt(
dbname string,
username string,
tbname string,
bytes number(38,0)) 
row format  delimited fields terminated by ',' 
location '/tmp/system_tbsize';

*/


