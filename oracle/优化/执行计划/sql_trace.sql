alter session set tracefile_identifier='mytest';
alter session set sql_trace=true;
select * from t.....
alter session set sql_trace=false;
tkprof wlsm_ora_6602_mytest.trc out.txt sys=no
cat out.txt
