rowid������64λ�����18���ַ���ʾ

32bit��object number��ÿ�����ݿ������4G������
10bit��file number��ÿ�����������1022���ļ���2���ļ�Ԥ����ʵ�������ɴ���1023���ļ���
22bit��block number��ÿ���ļ������4M��BLOCK
16bit��row number��ÿ��BLOCK�����64K��ROWS


���ݶ�����        �ļ����           ����             �б�� 
OOOOOO                FFF             BBBBBB             RRR 
32		      10               22                16
		
�е������ַ��һ�����ݿ�Ψһ��
A��Z     a-z        0-9     +    /
0  25   26 51      52 61   62  63


--��rowidת��Ϊ����
select dbms_rowid.rowid_object(rowid) object_id,
       dbms_rowid.rowid_relative_fno(rowid) file_id,
       dbms_rowid.rowid_block_number(rowid) block_id,
       dbms_rowid.rowid_row_number(rowid) num
  from scott.emp
 where ename = 'SCOTT';




-- ��ѯ������ݷֲ��ڶ��ٸ�����
select count(distinct substr(rowid,10,6))  from wf_node_record;

select count(distinct dbms_rowid.rowid_block_number(rowid)) block_cnts
  from SYS_ORG_INFO;