1.�ű�����
  ���ɴ���txt���Orc��ES��Hyperdrive����������orc���insert��䡣
  ES��ES��Ҫ���һ���ֶα�����string���ͣ����ǽű����ɵ�ddl���е�˳���Ǹ���Oracle���е�˳������ģ������ʱ��һ�в���string���ͣ���Ҫ�ֶ����е����е�˳��
  Orc�����ɵ����������Ͱ�ֶκͷ�Ͱ��Ŀ��Ҫ�ֶ�ָ�������Ҫ���ɷ���������޸�template/template_orc.sql��

2.�ű�ʹ��
  2.1 ��д conf/core.conf
      TABLE_OWNER��Oracle�б��owner��
                   ��RUN_TYPEΪUSERʱ���˴�������д����û����û�֮��ʹ��Ӣ�Ķ��ŷָ�����ʱ����Ҫ��дconf/tables.lst��
                   ��RUN_TYPEΪTABLEʱ���˴�ֻ����дһ���û���������Ҫ��conf/tables.lst��ָ�������ơ�
      PASSWORD����TABLE_OWNER��Ӧ�����룬����ж����ʹ��Ӣ�Ķ��ŷָ���
      EXTERNAL_TABLE_ROOT_DIR_HDFS�����·����Ĭ��Ϊ/oracle
      RUN_TYPE�� USER(Ĭ��)��TABLE

  2.2 ��д conf/tables.lst
      ����RUN_TYPEΪTABLEʱ��д��
      ÿ��һ�������������ִ�Сд��


  2.3 ���������ݿ�ʵ�����û�(Ĭ����oracle)������run.sh������ddlĿ¼���������н��
      $> sh run.sh
  
      ע�⣺���ϵͳ���ж�����ݿ�ʵ�������нű�ǰ���ֶ�����ORACLE_HOME��ORACLE_SID��

