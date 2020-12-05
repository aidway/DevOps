rowid：基于64位编码的18个字符显示

32bit的object number，每个数据库最多有4G个对象
10bit的file number，每个对象最多有1022个文件（2个文件预留，实验中最多可创建1023个文件）
22bit的block number，每个文件最多有4M个BLOCK
16bit的row number，每个BLOCK最多有64K个ROWS


数据对象编号        文件编号           块编号             行编号 
OOOOOO                FFF             BBBBBB             RRR 
32		      10               22                16
		
行的物理地址（一个数据库唯一）
A－Z     a-z        0-9     +    /
0  25   26 51      52 61   62  63


--将rowid转化为数字
select dbms_rowid.rowid_object(rowid) object_id,
       dbms_rowid.rowid_relative_fno(rowid) file_id,
       dbms_rowid.rowid_block_number(rowid) block_id,
       dbms_rowid.rowid_row_number(rowid) num
  from scott.emp
 where ename = 'SCOTT';




-- 查询表的数据分布在多少个块上
select count(distinct substr(rowid,10,6))  from wf_node_record;

select count(distinct dbms_rowid.rowid_block_number(rowid)) block_cnts
  from SYS_ORG_INFO;