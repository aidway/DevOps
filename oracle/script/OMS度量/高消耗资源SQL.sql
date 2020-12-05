1.查看总消耗时间最多的前10条SQL语句
select *
  from (select v.sql_id,
               v.child_number,
               v.sql_text,
               v.elapsed_time,
               v.cpu_time,
               v.disk_reads,
               rank() over(order by v.elapsed_time desc) elapsed_rank
          from v$sql v) a
 where elapsed_rank <= 10;

select SQL_FULLTEXT from v$sql where sql_id in('1qnc7bqsbrbru');
select SQL_FULLTEXT from v$sql where sql_id in('833vu2ypt2hmk');
select SQL_FULLTEXT from v$sql where sql_id in('a59nps9d6a9rg');


select sql_id
  from (select v.sql_id,
               v.elapsed_time/100000,
               rank() over(order by v.elapsed_time desc) elapsed_rank
          from v$sql v) a
 where elapsed_rank <= 3;

2.查看CPU消耗时间最多的前10条SQL语句
select *
  from (select v.sql_id,
               v.child_number,
               v.sql_text,
               v.elapsed_time,
               v.cpu_time,
               v.disk_reads,
               rank() over(order by v.cpu_time desc) elapsed_rank
          from v$sql v) a
 where elapsed_rank <= 10;

 

3.查看消耗磁盘读取最多的前10条SQL语句
select *
  from (select v.sql_id,
               v.child_number,
               v.sql_text,
               v.elapsed_time,
               v.cpu_time,
               v.disk_reads,
               rank() over(order by v.disk_reads desc) elapsed_rank
          from v$sql v) a
 where elapsed_rank <= 10;
 
 
 select sql_text,executions,buffer_gets,disk_reads from v$sql 
where buffer_gets > 100000
or disk_reads > 100000
order by buffer_gets+100*disk_reads desc
前5个花费最多CPU和时间：
select sql_text,executions,
round(elapsed_time/1000000,2) elapsed_seconds,
round(cpu_time/1000000,2) cpu_secs from 
(select * from v$sql order by elapsed_time desc)
where rownum<6
因为V$SQL是动态性能图，只能保留一些频繁执行的SQL。
请问怎么查询，如最近1天执行时间最长的SQL？



实时获取最耗CPU的SQL
 
在Oracle性能诊断和日常监控中，最耗CPU的语句通常也是我们最需要关心的语句。所以在Oracle10g的awr中，将cpu time和elapsed time最高的语句加入到了报表，并且放到了SQL语句部分的前两位。那么在平时的监控中，也可以通过shell脚本实时捕获系统中CPU耗用最多的进程中正在执行的SQL，以更加有效和及时的诊断和发现问题。
首先写一个根据spid来或者其SQL的脚本get_by_spid.sql
#!/bin/ksh
# creator:NinGoo
# function: get sql statement by spid
# parameter: spid
# useage: get_by_spid.sh spid
sqlplus -S /nolog <connect / as sysdba;
col SERIAL# format 999999
col sid format 99999
col username format a10
col machine format a12
col program format a32
col sql_text format a81
set lines 1000
set pages 1000
set verify off
col sql_hash_value new_value hash_value head hash_value
select sid,serial#,username,program,sql_hash_value,
to_char(logon_time,’yyyy/mm/dd hh24:mi:ss’) as login_time
from v\$session
where paddr in ( select addr from v\$process where spid=$1);
select sql_text
from v\$sqltext_with_newlines
where hash_value = &hash_value
order by piece;
exit;
EOF

然后再在另外一个shell脚本topsql.sh中获得系统中CPU耗用最多的oracle server process的spid，循环调用第一个脚本获得SQL 
#!/bin/ksh
# creator:NinGoo
# function: get top cpu sql
# parameter: N
# useage: topsql.sh N
if [ $# -eq 0 ]; then
echo “Usage: `basename $0` N”
exit 1
fi
topcpu=`ps auxw|grep LOCAL|sort -rn +2 |head -$1|awk ‘{print $2}’`
i=0
for spid in $topcpu
do
i=`expr $i + 1`
echo “\033[32;1m===============top $i cpu sql=============\033[0m”
. /home/oracle/worksh/get_by_spid.sh $spid
done
 
那么调用就很简单了，假如我们要看系统top 3的sql语句，只需要执行topsql.sh 3即可。当然，如果我们自己通过top/topas等工具已经获得spid了，那么只要执行get_by_spid.sh spid就能获得该进程正在执行的sql语句了。



