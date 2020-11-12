drop table default.tbsize_txt;
create external table default.tbsize_txt(dbname string,username string,tbname string,bytes number(38,0)) row format    delimited fields terminated by ',' location '/tmp/system_tbsize';
truncate table etl.tbsize;
insert into etl.tbsize  select dbname,username,tbname,bytes,sysdate from default.tbsize_txt;
--drop  table etl.tbsize;
--create table etl.tbsize(dbname string,username string,tbname string,bytes number(38,0),last_analyzed timestamp) stored as orc;
