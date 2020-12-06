create user brpmtest identified by brpmdba  account unlock 
default tablespace brpm
temporary tablespace temp;


grant create view to   BRPMTEST ;
grant connect,resource to BRPMTEST ;
revoke unlimited tablespace from BRPMTEST;
alter user  BRPMTEST quota 0 on sysaux;
alter user  BRPMTEST quota 0 on system;