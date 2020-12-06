create table sys.cebdba_sql_base_info
(sql_id varchar2(13),
 plan_hash_value number,
 parsing_schema_name varchar2(30),
 elapsed_time_base number
);
grant select,delete,update,insert on sys.cebdba_sql_base_info to dbsnmp;
