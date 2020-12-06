脚本作用：oms12c中添加目标，包括数据库实例、oms监听、数据库监听。该脚本只针对单实例数据库。

使用步骤：
1.填写配置文件oms12c_target_config，填好后将脚本和配置文件上传到oms12c server服务器（脚本目录无特殊要求）。
2.在oms12c server端，使用oracle用户运行脚本
$> sh add_oms12c_targets.sh
