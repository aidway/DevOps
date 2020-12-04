#!/bin/sh

#################################################################
#
# Version 1.0
# Date 2015-04-13
# Description:This script is used to analyze table's detail info.
# Note:run the script by oracle
#
#################################################################


table_owner=PBCEBDB
table_name=T_PB_LOG,T_PB_TRAN_GRP_CONV
instance_name=jkcj
analyze_date=`date "+%Y%m%d"`

echo $table_name  | awk -F ',' '{i=1;while(i<=NF){print $i;i++}}' | while read i;
do
        table_name2=`echo ${i}|awk '{print $1}'`
        echo "insert into analyze_table_temp values('$table_owner','$table_name2');" >> ./insert_into_analyze_table_temp.sql
        echo "select count(*)actual_num_rows from $table_owner.$table_name2;"  >> ./table_curr_cnt.sql
done 
echo "commit;" >>  ./insert_into_analyze_table_temp.sql

export ORACLE_SID=$instance_name
sqlplus  / as sysdba <<EOF
set linesize 150 pages 999 trimspool on
col segment_name for a30
col partitioned for a15
col owner for a10
col TABLE_NAME for a30
col COLUMN_NAME for a30
col index_name for a20
col actual_num_rows for 99999999999999999
set head on
set feed off
alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss';
create table analyze_table_temp (table_owner varchar2(30),table_name varchar2(50));
@insert_into_analyze_table_temp.sql
set markup html on spool on 
spool $instance_name_$analyze_date.html
select a.owner,
       a.table_name,
       a.last_analyzed,
       a.num_rows,
       a.partitioned,
       b.bytes / 1024 / 1024 size_mb
  from dba_tables a, dba_segments b,analyze_table_temp c
 where a.table_name = c.table_name
   and a.table_name = b.segment_name
   and a.owner=c.table_owner;
@table_curr_cnt.sql
select a.owner, a.table_name, b.index_name, c.BYTES / 1024 / 1024 size_mb
  from dba_tables a, dba_indexes b, dba_segments c,analyze_table_temp d
 where a.table_name = d.table_name
   and a.table_name = b.table_name
   and a.owner = b.table_owner
   and a.owner = d.table_owner
   and b.index_name = c.segment_name;
select a.TABLE_OWNER, a.TABLE_NAME, a.INDEX_NAME, a.COLUMN_NAME, a.COLUMN_POSITION
  from dba_ind_columns a,analyze_table_temp b
 where a.table_name = b.table_name
   and a.table_owner=b.table_owner
 order by a.table_name, a.index_name;
select a.owner, a.table_name, a.COLUMN_NAME, a.NUM_DISTINCT
  from dba_tab_columns a,analyze_table_temp b
 where a.table_name = b.table_name
   and a.owner=b.table_owner;
set markup html on spool on 
spool off
drop table analyze_table_temp purge;
exit
EOF
rm insert_into_analyze_table_temp.sql
rm table_curr_cnt.sql



