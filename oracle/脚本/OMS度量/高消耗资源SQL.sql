1.�鿴������ʱ������ǰ10��SQL���
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

2.�鿴CPU����ʱ������ǰ10��SQL���
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

 

3.�鿴���Ĵ��̶�ȡ����ǰ10��SQL���
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
ǰ5���������CPU��ʱ�䣺
select sql_text,executions,
round(elapsed_time/1000000,2) elapsed_seconds,
round(cpu_time/1000000,2) cpu_secs from 
(select * from v$sql order by elapsed_time desc)
where rownum<6
��ΪV$SQL�Ƕ�̬����ͼ��ֻ�ܱ���һЩƵ��ִ�е�SQL��
������ô��ѯ�������1��ִ��ʱ�����SQL��



ʵʱ��ȡ���CPU��SQL
 
��Oracle������Ϻ��ճ�����У����CPU�����ͨ��Ҳ����������Ҫ���ĵ���䡣������Oracle10g��awr�У���cpu time��elapsed time��ߵ������뵽�˱������ҷŵ���SQL��䲿�ֵ�ǰ��λ����ô��ƽʱ�ļ���У�Ҳ����ͨ��shell�ű�ʵʱ����ϵͳ��CPU�������Ľ���������ִ�е�SQL���Ը�����Ч�ͼ�ʱ����Ϻͷ������⡣
����дһ������spid��������SQL�Ľű�get_by_spid.sql
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
to_char(logon_time,��yyyy/mm/dd hh24:mi:ss��) as login_time
from v\$session
where paddr in ( select addr from v\$process where spid=$1);
select sql_text
from v\$sqltext_with_newlines
where hash_value = &hash_value
order by piece;
exit;
EOF

Ȼ����������һ��shell�ű�topsql.sh�л��ϵͳ��CPU��������oracle server process��spid��ѭ�����õ�һ���ű����SQL 
#!/bin/ksh
# creator:NinGoo
# function: get top cpu sql
# parameter: N
# useage: topsql.sh N
if [ $# -eq 0 ]; then
echo ��Usage: `basename $0` N��
exit 1
fi
topcpu=`ps auxw|grep LOCAL|sort -rn +2 |head -$1|awk ��{print $2}��`
i=0
for spid in $topcpu
do
i=`expr $i + 1`
echo ��\033[32;1m===============top $i cpu sql=============\033[0m��
. /home/oracle/worksh/get_by_spid.sh $spid
done
 
��ô���þͺܼ��ˣ���������Ҫ��ϵͳtop 3��sql��䣬ֻ��Ҫִ��topsql.sh 3���ɡ���Ȼ����������Լ�ͨ��top/topas�ȹ����Ѿ����spid�ˣ���ôֻҪִ��get_by_spid.sh spid���ܻ�øý�������ִ�е�sql����ˡ�



