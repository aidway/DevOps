1.脚本功能
  生成创建txt外表、Orc表、ES表、Hyperdrive表、由外表插入orc表的insert语句。
  ES表：ES表要求第一个字段必须是string类型，但是脚本生成的ddl中列的顺序是根据Oracle中列的顺序产生的，如果此时第一列不是string类型，需要手动进行调整列的顺序。
  Orc表：生成的是事务表，分桶字段和分桶数目需要手动指定。如果要生成非事务表，可修改template/template_orc.sql。

2.脚本使用
  2.1 填写 conf/core.conf
      TABLE_OWNER：Oracle中表的owner。
                   当RUN_TYPE为USER时，此处可以填写多个用户，用户之间使用英文逗号分隔。此时不需要填写conf/tables.lst。
                   当RUN_TYPE为TABLE时，此处只能填写一个用户，并且需要在conf/tables.lst中指定表名称。
      PASSWORD：与TABLE_OWNER对应的密码，如果有多个，使用英文逗号分隔。
      EXTERNAL_TABLE_ROOT_DIR_HDFS：外表路径，默认为/oracle
      RUN_TYPE： USER(默认)或TABLE

  2.2 填写 conf/tables.lst
      仅当RUN_TYPE为TABLE时填写。
      每行一个表名，不区分大小写。


  2.3 在启动数据库实例的用户(默认是oracle)下运行run.sh，将在ddl目录下生成运行结果
      $> sh run.sh
  
      注意：如果系统上有多个数据库实例，运行脚本前需手动设置ORACLE_HOME和ORACLE_SID。

