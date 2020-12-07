-- 检查系统中是否存在过长的hash chain
select hladdr,count(*) from x$bh group by  hladdr order by 2 asc;