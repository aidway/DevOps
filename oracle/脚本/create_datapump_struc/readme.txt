1.脚本作用：生成数据泵导入导出用户表结构的脚本,存储过程、统计信息不导出。
2.使用说明：以root用户运行create_datapump_struc.sh即可,导出的文件上传ftp服务器后会删除本地的*.dmp *.sh *.log *.tar *.OK，每次导出前都会将上一次的导出文  件删除。
3.配置文件说明，配置文件的路径由$instanceconf_dir指定：
  instancesnot.conf：不导出该配置文件中的实例
  racinstances.conf:指定rac实例的导出目录，格式为instance_name,expdp_dir。注意目录最后面不要加'/',且保证oracle有写该目录的权限
4.默认情况下，导出dmp到归档目录，所以归档目录必须存在且有足够剩余空间，特殊情况可以在racinstances.conf中配置。   
5.ftp上传的日志${expdp_dir}/dumpfiles/${instance_name}_ftp.log，该日志一直保留，但下次上传时将上次的覆盖。       
6.可能风险：使用sys用户执行expdp时，会在system表空间创建一个lob段，要防止system表空间满
           由于导出的是表结构信息，如果表结构频繁变动，可能会出现ora-01555错误
           expdp使用stream pool，如果sga不足够大，可能会出先ora-04031错误
             如果多个系统同时ftp上传，可能因为网络阻塞导致上传失败
           如果从racinstances.conf中读取的archive_dest是空值，那么dmp文件将被创建到/目录

说明：执行create_datapump_struc.sh后，会在/home/sysadmin/check/bin/下生expdp_all_instance.sh脚本,expdp_all_instance.sh
调用每个实例的expdp_$instance_name.sh脚本。


instancesnot.conf：不导出该配置文件中的实例
racinstances.conf:rac配置文件，格式为instance_name,expdp_dir  注意最后面不要加/  保证oracle有写的权限


脚本目录说明：

                     $log_archive_dest                           /home/sysadmin/check/bin/
                             |                                              |
                             |                                              |
                 expdp_db_struc_$instance_name                    expdp_all_instance.sh
                 	     |      
                             |
                  ------------------------
         	  |                      |
                  |                      |
              dumpfiles               scripts
                  |                      |
                  |                      |
           -------------           --------------
           |           |           |            |
           |           |           |            |
         *.dmp     impdp*.sh    $username    expdp_$instance_name.sh
                                   |
                                   | 
                                expdp*.sh    


expdp*.sh：导出单个用户
expdp_$instance_name.sh：导出单个实例
expdp_all_instance.sh：导出所有实例
impdp*.sh：导入单个用户



脚本结构说明：
1.通过进程查询主机上启动的实例及相应的用户
2.查询归档路径，如果归档路径不存在，退出，否则，在归档路径下创建expdp_db_struc目录
3.查询实例有哪些应用用户
4.生成导出、导入、ftp上传单个用户的脚本
5.生成导出单个实例并上传的脚本
6.生成导出所有实例并上传的脚本