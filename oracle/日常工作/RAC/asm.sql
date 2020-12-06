图形化界面： asmca
命令行工具： asmcmd



-- 查看diskgroup空间大小，以及ASM状态
select name, total_mb, free_mb, usable_file_mb, state
  from v$asm_diskgroup;



-- 查看ASM硬盘信息
col PATh for a10
col FAILGROUP for a10
set line 128 pages 999
column name for a10
select group_number, disk_number, name, mount_status, header_status,
mode_status, state, path, failgroup, mount_date, total_mb, free_mb
from v$asm_disk order by group_number, disk_number;




set line 200 pages 999
col name for a15
col type for a10
col state for a10
col path for a30


-- 查询可用DG
select name,type,state,total_mb,free_mb  from v$asm_diskgroup;


磁盘冗余
外部冗余：asm不对数据库文件镜像，所用磁盘最少，有效磁盘空间是所有磁盘空间的大小之和
常规冗余：asm使用2份镜像存储，最少需要两块磁盘，有效磁盘空间是所有磁盘设备大小的1/2
高冗余：asm使用3份镜像存储，最少需要三块磁盘，有效磁盘空间是所有磁盘设备大小的1/3




