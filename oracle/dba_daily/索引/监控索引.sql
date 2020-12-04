-- 启用索引监控  
alter index emp_ename_idx monitoring usage;  


-- 查看索引是否使用  
select index_name,monitoring,used from v$object_usage;


-- 禁用索引监控  
alter index emp_ename_idx nomonitoring usage; 
