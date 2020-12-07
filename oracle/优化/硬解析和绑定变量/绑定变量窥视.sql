-- 查看隐含参数
set line 200 pages 999
col name for a40
col value for a15
col DESCRIPTION for a50
select a.ksppinm name, b.ksppstvl value, a.ksppdesc description
  from x$ksppi a, x$ksppcv b
 where a.indx = b.indx
   and a.ksppinm like '_optim_peek_user_binds';


-- 修改隐含参数
alter system set "_optim_peek_user_binds"=false scope=spfile;

