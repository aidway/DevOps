drop table t1;
create table t1
(   a number,
    b number(10),
    c number(10,3),
    d float,
    e INTEGER,
    f VARCHAR2(10),
    g NVARCHAR2(10),
    h VARCHAR(10),
    i CHAR(10),
    j NCHAR(10),
    k date,
    l TIMESTAMP,
    m TIMESTAMP(8)
);
 
insert into t1 values(12.34,12,12.34,12.34,12,'ÖÐ¹ú','test','tdh','poc','sh',sysdate,sysdate,sysdate); 
 
sudo -u hdfs sqoop import --connect jdbc:oracle:thin:@172.16.2.67:1521:orcl --username scott --password tiger  \
--table SCOTT.T1 \
--target-dir /oracle/SCOTT/T1 \
--fields-terminated-by "\\01" \
--hive-drop-import-delims     \
--null-string '\\N'           \
--null-non-string '\\N'       \
-m 1 



