1.�ű����ã��������ݱõ��뵼���û���ṹ�Ľű�,�洢���̡�ͳ����Ϣ��������
2.ʹ��˵������root�û�����create_datapump_struc.sh����,�������ļ��ϴ�ftp���������ɾ�����ص�*.dmp *.sh *.log *.tar *.OK��ÿ�ε���ǰ���Ὣ��һ�εĵ�����  ��ɾ����
3.�����ļ�˵���������ļ���·����$instanceconf_dirָ����
  instancesnot.conf���������������ļ��е�ʵ��
  racinstances.conf:ָ��racʵ���ĵ���Ŀ¼����ʽΪinstance_name,expdp_dir��ע��Ŀ¼����治Ҫ��'/',�ұ�֤oracle��д��Ŀ¼��Ȩ��
4.Ĭ������£�����dmp���鵵Ŀ¼�����Թ鵵Ŀ¼������������㹻ʣ��ռ䣬�������������racinstances.conf�����á�   
5.ftp�ϴ�����־${expdp_dir}/dumpfiles/${instance_name}_ftp.log������־һֱ���������´��ϴ�ʱ���ϴεĸ��ǡ�       
6.���ܷ��գ�ʹ��sys�û�ִ��expdpʱ������system��ռ䴴��һ��lob�Σ�Ҫ��ֹsystem��ռ���
           ���ڵ������Ǳ�ṹ��Ϣ�������ṹƵ���䶯�����ܻ����ora-01555����
           expdpʹ��stream pool�����sga���㹻�󣬿��ܻ����ora-04031����
             ������ϵͳͬʱftp�ϴ���������Ϊ�������������ϴ�ʧ��
           �����racinstances.conf�ж�ȡ��archive_dest�ǿ�ֵ����ôdmp�ļ�����������/Ŀ¼

˵����ִ��create_datapump_struc.sh�󣬻���/home/sysadmin/check/bin/����expdp_all_instance.sh�ű�,expdp_all_instance.sh
����ÿ��ʵ����expdp_$instance_name.sh�ű���


instancesnot.conf���������������ļ��е�ʵ��
racinstances.conf:rac�����ļ�����ʽΪinstance_name,expdp_dir  ע������治Ҫ��/  ��֤oracle��д��Ȩ��


�ű�Ŀ¼˵����

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


expdp*.sh�����������û�
expdp_$instance_name.sh����������ʵ��
expdp_all_instance.sh����������ʵ��
impdp*.sh�����뵥���û�



�ű��ṹ˵����
1.ͨ�����̲�ѯ������������ʵ������Ӧ���û�
2.��ѯ�鵵·��������鵵·�������ڣ��˳��������ڹ鵵·���´���expdp_db_strucĿ¼
3.��ѯʵ������ЩӦ���û�
4.���ɵ��������롢ftp�ϴ������û��Ľű�
5.���ɵ�������ʵ�����ϴ��Ľű�
6.���ɵ�������ʵ�����ϴ��Ľű�