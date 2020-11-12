select 'create  table f_cbs_bcdbg (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bcdbg'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bcdbg');

select 'create  table f_cbs_bcdxy (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bcdxy'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bcdxy');

select 'create  table f_cbs_bcdbz (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bcdbz'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bcdbz');

select 'create  table f_cbs_axjfh (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_axjfh'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_axjfh');

select 'create  table f_cbs_bcdkd (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bcdkd'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bcdkd');

select 'create  table f_cbs_bcdkm (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bcdkm'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bcdkm');

select 'create  table f_cbs_axjmx (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_axjmx'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_axjmx');

select 'create  table f_cbs_bcrkd (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bcrkd'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bcrkd');

select 'create  table f_cbs_bgskx (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bgskx'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bgskx');

select 'create  table f_cbs_bcdqy (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bcdqy'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bcdqy');

select 'create  table f_cbs_bkakc (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bkakc'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bkakc');

select 'create  table f_cbs_vpzfb (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_vpzfb'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_vpzfb');

select 'create  table f_cbs_bpzsj (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bpzsj'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bpzsj');

select 'create  table f_cbs_brvpz (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_brvpz'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_brvpz');

select 'create  table f_cbs_vkhpz (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_vkhpz'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_vkhpz');

select 'create  table f_cbs_pkhzj (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pkhzj'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pkhzj');

select 'create  table f_cbs_pkhhb (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pkhhb'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pkhhb');

select 'create  table f_cbs_btykh (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_btykh'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_btykh');

select 'create  table f_cbs_pfzjg (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pfzjg'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pfzjg');

select 'create  table f_cbs_bkhhc (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bkhhc'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bkhhc');

select 'create  table f_cbs_bkhlx (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bkhlx'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bkhlx');

select 'create  table f_cbs_bdgkh (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bdgkh'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bdgkh');

select 'create  table f_cbs_pywcs (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pywcs'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pywcs');

select 'create  table f_cbs_pyhdm (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pyhdm'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pyhdm');

select 'create  table f_cbs_bzjwt (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bzjwt'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bzjwt');

select 'create  table f_cbs_bdsls (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bdsls'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bdsls');

select 'create  table f_cbs_bfymx (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bfymx'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bfymx');

select 'create  table f_cbs_bdygl (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bdygl'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bdygl');

select 'create  table f_cbs_bdlmx (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bdlmx'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bdlmx');

select 'create  table f_cbs_adzyw (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_adzyw'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_adzyw');

select 'create  table f_cbs_adymx (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_adymx'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_adymx');

select 'create  table f_cbs_bgpgx (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bgpgx'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bgpgx');

select 'create  table f_cbs_bgpcu (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bgpcu'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bgpcu');

select 'create  table f_cbs_bgczh (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bgczh'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bgczh');

select 'create  table f_cbs_btzck (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_btzck'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_btzck');

select 'create  table f_cbs_bdebl (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bdebl'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bdebl');

select 'create  table f_cbs_bplkh (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bplkh'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bplkh');

select 'create  table f_cbs_bacst (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bacst'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bacst');

select 'create  table f_cbs_bfrdl (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bfrdl'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bfrdl');

select 'create  table f_cbs_bxjzh (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bxjzh'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bxjzh');

select 'create  table f_cbs_adpal (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_adpal'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_adpal');

select 'create  table f_cbs_adpaw (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_adpaw'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_adpaw');

select 'create  table f_cbs_adpar (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_adpar'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_adpar');

select 'create  table f_cbs_adpam (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_adpam'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_adpam');

select 'create  table f_cbs_bcasn (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bcasn'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bcasn');

select 'create  table f_cbs_bdpid (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bdpid'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bdpid');

select 'create  table f_cbs_bacbc (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bacbc'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bacbc');

select 'create  table f_cbs_blxmx (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_blxmx'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_blxmx');

select 'create  table f_cbs_akncm (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_akncm'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_akncm');

select 'create  table f_cbs_rywzz (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_rywzz'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_rywzz');

select 'create  table f_cbs_rkmzz (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_rkmzz'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_rkmzz');

select 'create  table f_cbs_plnfl (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_plnfl'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_plnfl');

select 'create  table f_cbs_bldmx (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bldmx'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bldmx');

select 'create  table f_cbs_bzqdj (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bzqdj'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bzqdj');

select 'create  table f_cbs_bstzf (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bstzf'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bstzf');

select 'create  table f_cbs_bwjtj (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bwjtj'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bwjtj');

select 'create  table f_cbs_blnbz (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_blnbz'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_blnbz');

select 'create  table f_cbs_adksr (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_adksr'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_adksr');

select 'create  table f_cbs_blndq (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_blndq'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_blndq');

select 'create  table f_cbs_blned (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_blned'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_blned');

select 'create  table f_cbs_blndb (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_blndb'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_blndb');

select 'create  table f_cbs_blnfk (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_blnfk'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_blnfk');

select 'create  table f_cbs_bdkzl (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bdkzl'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bdkzl');

select 'create  table f_cbs_pqdgy (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pqdgy'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pqdgy');

select 'create  table f_cbs_ahhzh (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_ahhzh'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_ahhzh');

select 'create  table f_cbs_bywzh (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bywzh'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bywzh');

select 'create  table f_cbs_bdkwl (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bdkwl'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bdkwl');

select 'create  table f_cbs_bshqs (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bshqs'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bshqs');

select 'create  table f_cbs_bkhqy (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bkhqy'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bkhqy');

select 'create  table f_cbs_bfhmx (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bfhmx'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bfhmx');

select 'create  table f_cbs_pxtcs (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pxtcs'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pxtcs');

select 'create  table f_cbs_bgzdj (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bgzdj'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bgzdj');

select 'create  table f_cbs_azhjx (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_azhjx'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_azhjx');

select 'create  table f_cbs_plbgx (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_plbgx'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_plbgx');

select 'create  table f_cbs_pgjpz (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pgjpz'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pgjpz');

select 'create  table f_cbs_pgjcs (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pgjcs'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pgjcs');

select 'create  table f_cbs_bdjmx (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bdjmx'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bdjmx');

select 'create  table f_cbs_agjmx (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_agjmx'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_agjmx');

select 'create  table f_cbs_phbcs (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_phbcs'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_phbcs');

select 'create  table f_cbs_pgxdy (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pgxdy'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pgxdy');

select 'create  table f_cbs_pgbdz (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pgbdz'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pgbdz');

select 'create  table f_cbs_pjjrb (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pjjrb'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pjjrb');

select 'create  table f_cbs_pjyzy (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pjyzy'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pjyzy');

select 'create  table f_cbs_pprod (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pprod'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pprod');

select 'create  table f_cbs_pzycs (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pzycs'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pzycs');

select 'create  table f_cbs_pjgbz (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pjgbz'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pjgbz');

select 'create  table f_cbs_pjgkz (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pjgkz'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pjgkz');

select 'create  table f_cbs_bpmjn (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bpmjn'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bpmjn');

select 'create  table f_cbs_pgyls (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pgyls'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pgyls');

select 'create  table f_cbs_bpjgs (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bpjgs'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bpjgs');

select 'create  table f_cbs_bwtmx (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bwtmx'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bwtmx');

select 'create  table f_cbs_bwtdj (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bwtdj'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bwtdj');

select 'create  table f_cbs_bywls (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bywls'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bywls');

select 'create  table f_cbs_pjggy (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pjggy'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pjggy');

select 'create  table f_cbs_pwxdz (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pwxdz'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pwxdz');

select 'create  table f_cbs_bwxqx (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bwxqx'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bwxqx');

select 'create  table f_cbs_pgycs (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_pgycs'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_pgycs');

select 'create  table f_cbs_bwxcr (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bwxcr'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bwxcr');

select 'create  table f_cbs_bgypz (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bgypz'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bgypz');

select 'create  table f_cbs_bwxmx (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bwxmx'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bwxmx');

select 'create  table f_cbs_bgysj (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cbs_bgysj'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cbs_bgysj');

select 'create  table f_cms_cif_group (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_group'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_group');

select 'create  table f_cms_zc_plasset (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_zc_plasset'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_zc_plasset');

select 'create  table f_cms_cif_pers_soc_del (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_pers_soc_del'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_pers_soc_del');

select 'create  table f_cms_auth_split_lst (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_auth_split_lst'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_auth_split_lst');

select 'create  table f_cms_cif_trust_del (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_trust_del'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_trust_del');

select 'create  table f_cms_cif_corp_ap_corp (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_corp_ap_corp'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_corp_ap_corp');

select 'create  table f_cms_prod_coop_item_rel (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_prod_coop_item_rel'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_prod_coop_item_rel');

select 'create  table f_cms_apply_wt (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_apply_wt'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_apply_wt');

select 'create  table f_cms_cif_trust (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_trust'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_trust');

select 'create  table f_cms_prod_hx_rel (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_prod_hx_rel'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_prod_hx_rel');

select 'create  table f_cms_hx_ln_parm (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_hx_ln_parm'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_hx_ln_parm');

select 'create  table f_cms_cif_black_parm (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_black_parm'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_black_parm');

select 'create  table f_cms_cif_pers_soc (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_pers_soc'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_pers_soc');

select 'create  table f_cms_parm_key (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_parm_key'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_parm_key');

select 'create  table f_cms_apply_bill (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_apply_bill'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_apply_bill');

select 'create  table f_cms_cif_trade (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_trade'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_trade');

select 'create  table f_cms_cif_way (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_way'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_way');

select 'create  table f_cms_prod_dic (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_prod_dic'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_prod_dic');

select 'create  table f_cms_prj_sec_money_lst (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_prj_sec_money_lst'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_prj_sec_money_lst');

select 'create  table f_cms_gage_high_rel (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_gage_high_rel'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_gage_high_rel');

select 'create  table f_cms_ln_pact_high (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_ln_pact_high'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_ln_pact_high');

select 'create  table f_cms_ln_pay_ctl (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_ln_pay_ctl'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_ln_pay_ctl');

select 'create  table f_cms_apply_com (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_apply_com'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_apply_com');

select 'create  table f_cms_auth_hold (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_auth_hold'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_auth_hold');

select 'create  table f_cms_ln_note_cancel (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_ln_note_cancel'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_ln_note_cancel');

select 'create  table f_cms_ln_due_slr (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_ln_due_slr'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_ln_due_slr');

select 'create  table f_cms_eval_union (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_eval_union'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_eval_union');

select 'create  table f_cms_cif_bank_serno (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_bank_serno'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_bank_serno');

select 'create  table f_cms_cif_pers_fam_del (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_pers_fam_del'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_pers_fam_del');

select 'create  table f_cms_eval_union_mem (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_eval_union_mem'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_eval_union_mem');

select 'create  table f_cms_apply_exp (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_apply_exp'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_apply_exp');

select 'create  table f_cms_rpt_large_cif (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_rpt_large_cif'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_rpt_large_cif');

select 'create  table f_cms_cif_rel_inf (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_rel_inf'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_rel_inf');

select 'create  table f_cms_apply_aj (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_apply_aj'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_apply_aj');

select 'create  table f_cms_batch_ln (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_batch_ln'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_batch_ln');

select 'create  table f_cms_cif_black (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_black'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_black');

select 'create  table f_cms_auth_amt_split (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_auth_amt_split'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_auth_amt_split');

select 'create  table f_cms_auth_occ_reg (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_auth_occ_reg'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_auth_occ_reg');

select 'create  table f_cms_risk_five (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_risk_five'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_risk_five');

select 'create  table f_cms_cif_pers_fam (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_pers_fam'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_pers_fam');

select 'create  table f_cms_cif_black_cause (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_black_cause'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_black_cause');

select 'create  table f_cms_cif_op_rel (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_op_rel'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_op_rel');

select 'create  table f_cms_acc_custom (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_acc_custom'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_acc_custom');

select 'create  table f_cms_cif_inf_chn (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_inf_chn'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_inf_chn');

select 'create  table f_ebs_xxt_fund_int_gl_b (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ebs_xxt_fund_int_gl_b'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ebs_xxt_fund_int_gl_b');

select 'create  table f_cms_tbl_org_departments (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_tbl_org_departments'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_tbl_org_departments');

select 'create  table f_cms_tbl_org_user (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_tbl_org_user'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_tbl_org_user');

select 'create  table f_cms_cif_corp_inv (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_corp_inv'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_corp_inv');

select 'create  table f_cms_gage_owner (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_gage_owner'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_gage_owner');

select 'create  table f_cms_gage_rate (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_gage_rate'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_gage_rate');

select 'create  table f_cms_adzyw (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_adzyw'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_adzyw');

select 'create  table f_cms_prj_cooperate (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_prj_cooperate'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_prj_cooperate');

select 'create  table f_cms_prj_cop_cont (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_prj_cop_cont'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_prj_cop_cont');

select 'create  table f_cms_auth_apply (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_auth_apply'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_auth_apply');

select 'create  table f_cms_app_note (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_app_note'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_app_note');

select 'create  table f_cms_auth_cont (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_auth_cont'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_auth_cont');

select 'create  table f_cms_aft1_due (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_aft1_due'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_aft1_due');

select 'create  table f_cms_cif_fin_main (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_fin_main'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_fin_main');

select 'create  table f_cms_cif_fin_ecap (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_fin_ecap'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_fin_ecap');

select 'create  table f_ecf_m_cust_blat_info (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ecf_m_cust_blat_info'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ecf_m_cust_blat_info');

select 'create  table f_ecf_m_org_cust_outline_info (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ecf_m_org_cust_outline_info'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ecf_m_org_cust_outline_info');

select 'create  table f_cht_gajgcxqqxx (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cht_gajgcxqqxx'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cht_gajgcxqqxx');

select 'create  table f_cht_gajgkzqqxx (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cht_gajgkzqqxx'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cht_gajgkzqqxx');

select 'create  table f_cht_fysfqqxxb (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cht_fysfqqxxb'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cht_fysfqqxxb');

select 'create  table f_cht_fysfqqbzxrzhxxb (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cht_fysfqqbzxrzhxxb'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cht_fysfqqbzxrzhxxb');

select 'create  table f_cht_querymain (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cht_querymain'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cht_querymain');

select 'create  table f_cht_command (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cht_command'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cht_command');

select 'create  table f_ecf_m_cust_rel (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ecf_m_cust_rel'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ecf_m_cust_rel');

select 'create  table f_ecf_m_org_bond_info (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ecf_m_org_bond_info'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ecf_m_org_bond_info');

select 'create  table f_ecf_m_org_executives_info (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ecf_m_org_executives_info'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ecf_m_org_executives_info');

select 'create  table f_ecf_m_org_stock_info (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ecf_m_org_stock_info'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ecf_m_org_stock_info');

select 'create  table f_ecf_m_per_ast_info (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ecf_m_per_ast_info'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ecf_m_per_ast_info');

select 'create  table f_ecf_m_per_commerial_insur (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ecf_m_per_commerial_insur'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ecf_m_per_commerial_insur');

select 'create  table f_ecf_m_per_cust_ext_info (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ecf_m_per_cust_ext_info'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ecf_m_per_cust_ext_info');

select 'create  table f_ecf_m_per_cust_impt_ident (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ecf_m_per_cust_impt_ident'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ecf_m_per_cust_impt_ident');

select 'create  table f_ecf_m_per_cust_tax_info (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ecf_m_per_cust_tax_info'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ecf_m_per_cust_tax_info');

select 'create  table f_ecf_m_per_family_stat (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ecf_m_per_family_stat'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ecf_m_per_family_stat');

select 'create  table f_ecf_m_per_inv_fin_info (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ecf_m_per_inv_fin_info'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ecf_m_per_inv_fin_info');

select 'create  table f_ecf_m_per_liabilities (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ecf_m_per_liabilities'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ecf_m_per_liabilities');

select 'create  table f_ecf_m_per_vehicle_info (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ecf_m_per_vehicle_info'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ecf_m_per_vehicle_info');

select 'create  table f_ecf_m_per_work_history (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ecf_m_per_work_history'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ecf_m_per_work_history');

select 'create  table f_ecf_m_sign_info (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ecf_m_sign_info'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ecf_m_sign_info');

select 'create  table f_cms_cif_fin_model (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_cms_cif_fin_model'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_cms_cif_fin_model');

select 'create  table f_ccs_prmcd (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ccs_prmcd'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ccs_prmcd');

select 'create  table f_ccs_card (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ccs_card'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ccs_card');

select 'create  table f_ccs_mpau (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ccs_mpau'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ccs_mpau');

select 'create  table f_ccs_event (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ccs_event'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ccs_event');

select 'create  table f_ccs_acct (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ccs_acct'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ccs_acct');

select 'create  table f_ccs_ddac (' from system.dual
union all
select '   ' ||  case when column_id =0 then '' else ',' end || sqlTxt
  from (select column_id,
               column_name || ' ' || regexp_replace(column_type,',ORACLE','') || ' DEFAULT "' ||
               default_value || '" COMMENT "' || commentstring || '"' sqlTxt
          from system.columns_v
         where database_name = 'fdm'
           and table_name = 'f_ccs_ddac'
         order by table_name, column_id asc)
union all
select case when bucket_column is not null then t1 else t2 end   from (
select bucket_column,' ) CLUSTERED BY ( ' || bucket_column || ' ) into ' || bucket_number ||
       ' BUCKETS stored as orc TBLPROPERTIES ("transactional"="true")\;' t1,' ) stored as orc\;' t2
  from system.buckets_v right join system.dual
  on 1 =1
 and database_name = 'fdm'
   and table_name = 'f_ccs_ddac');

