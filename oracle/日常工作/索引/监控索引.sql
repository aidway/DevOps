-- �����������  
alter index emp_ename_idx monitoring usage;  


-- �鿴�����Ƿ�ʹ��  
select index_name,monitoring,used from v$object_usage;


-- �����������  
alter index emp_ename_idx nomonitoring usage; 
