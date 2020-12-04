exec dbms_stats.FLUSH_DATABASE_MONITORING_INFO();
select to_char(sysdate,'yyyymmdd'),
         'common',
         a.table_name,
         owner,
         'dbms_stats.gather_table_stats(ownname=>''' || owner ||
         ''', tabname=>''' || a.table_name || ''');',
         'common',
         null
    from dba_tables a,
         CEBDBA_STATS_SPECIAL_PARA b,
         (select table_owner,
                 table_name,
                 sum(inserts) sum_i,
                 sum(updates) sum_u,
                 sum(deletes) sum_d
            from sys.dba_tab_modifications
           group by table_owner, table_name) c
   where a.table_name = upper(b.table_name(+))
     and a.owner = upper(b.table_owner(+))
     and b.table_name is null
     and a.table_name = c.table_name
     and a.owner = c.table_owner
     and a.owner in ('&username')
     and ((c.sum_i + c.sum_u + c.sum_d) /
         decode(a.num_rows, null, 1, 0, 1, a.num_rows) >= 0.1);



select to_char(sysdate,'yyyymmdd'),
         'common',
         a.table_name,
         owner,
         'dbms_stats.gather_table_stats(ownname=>''' || owner ||
         ''', tabname=>''' || a.table_name || ''');',
         'common',
         null
    from dba_tables a,
         (select table_owner,
                 table_name,
                 sum(inserts) sum_i,
                 sum(updates) sum_u,
                 sum(deletes) sum_d
            from sys.dba_tab_modifications
           group by table_owner, table_name) c
   where a.table_name = c.table_name
     and a.owner = c.table_owner
     and a.owner in ('sysman')
     and ((c.sum_i + c.sum_u + c.sum_d) /
         decode(a.num_rows, null, 1, 0, 1, a.num_rows) >= 0.1);



