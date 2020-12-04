#!/bin/sh

#########################################################################################################
#
# Description:create expdp and impdp scripts
# version:1.7
# date:2016-2-16
#
# 1.chmod 755  expdp_dir
# 
# NOTE:run the script by ROOT!
# 
#########################################################################################################


## expdp variables
expdp_date=`date "+%Y%m%d"`
expdp_all_instance_dir=/opt/smdb_agent/plugin

## impdp variables
impdp_dir=/home/dds/ddsftp/ORAMETA
impdp_user=ddsdmp
impdp_password=ddsdmp
impdp_default_tbs=DDSDATA1
impdp_instance_name=dds1

## ftp variables
ftp_ip=10.1.7.28
ftp_user=smdb
ftp_password=smdbput
ftp_dir=/smdb/hostinfo/data/oradata

## instance configure files path
instanceconf_dir=/opt/smdb_agent/conf

 
## check instancesnot.conf racinstances.conf
if ! [ -f $instanceconf_dir/instancesnot.conf ];then
        echo "$instanceconf_dir/instancesnot.conf do not exists."
        exit
fi
if ! [ -f $instanceconf_dir/racinstances.conf ];then
        echo "$instanceconf_dir/racinstances.conf do not exists."
        exit
fi

## for each instance
ps -ef|grep [o]ra_smon|awk 'sub(/ora_smon_/,"",$NF){print $1,$NF}' | while read i;
do    
    os_username=`echo ${i}|awk '{print $1}'`
    instance_name=`echo ${i}|awk '{print $2}'`

    ## if the instance in instancesnot.conf,do not expdp the instance
    inst_flag=`cat $instanceconf_dir/instancesnot.conf | grep $instance_name | wc -l`
    if [ $inst_flag -gt 0 ]; then
        echo "The instance $instance_name exists in instancesnot.conf."
        continue
    fi

    ################################### 1.create expdp directory ###################################
    ## if RAC instacne, read $archive_dest from racinstances.conf
    if [ `cat $instanceconf_dir/racinstances.conf | grep $instance_name, | wc -l` -gt 0 ];then
        archive_dest=`cat $instanceconf_dir/racinstances.conf | grep $instance_name, | awk  -F ',' '{print $2}'`
    else 
    	## query archive log dest
    	TARGET=\'PRIMARY\'
    	STATUS=\'VALID\'   
       	su - "${os_username}" <<EOO >/dev/null 2>&1
    	export ORACLE_SID=$instance_name
    	sqlplus -S '/ as sysdba' 
    	set pagesize 100 feedback off heading off linesize 180 trimspool on
    	spool /tmp/archive_dest.lst
    	select s.DESTINATION
          from v\$archive_dest s
         where s.TARGET = $TARGET and s.STATUS = $STATUS ;
    	spool off
        exit
EOO
    	archive_dest=`cat /tmp/archive_dest.lst | grep -v ^$`
    	rm  /tmp/archive_dest.lst
    fi

    ## check archive log directory
    if ! [ -d $archive_dest ];then
        echo "Instance $instance_name: archive log dest does not exists,please check the path."
        continue
    fi

    ## create expdp directory
    expdp_dir=`echo $archive_dest | sed 's/.*=//'`/expdp_db_struc_`echo $instance_name`
    
    rm -r $expdp_dir
    mkdir -p $expdp_dir
    chmod 755 $expdp_dir

    ## change current directory
    cd $expdp_dir

    ################################### 2.create expdp¡¢impdp¡¢ftp scripts ################################### 
    ## query the user of the database 
    su - "${os_username}" <<EOO >/dev/null 2>&1
    export ORACLE_SID=$instance_name
    cd $expdp_dir
    sqlplus -s '/ as sysdba'     
    set pagesize 100 feedback off heading off linesize 180 trimspool on
    spool /tmp/username_list.tmp
    select username 
      from dba_users 
     where username not in 
           ('MONITOR','SYS','SYSTEM','SYSMAN','DIP','TSMSYS','MGMT_VIEW','ORDSYS',
            'SCOTT','DBSNMP','ORACLE_OCM','OUTLN','SQLTXPLAIN','WMSYS','CTXSYS',
            'APPQOSSYS','SI_INFORMTN_SCHEMA','XDB','PERFSTAT','ACCOUNT','ANONYMOUS','DMSYS',
            'EXFSYS','MDDATA','MDSYS','OLAPSYS','ORDPLUGINS','OGG','DBVIEW','GOLDENGATE') 
       and username not like  'QUERY\_%' escape '\' 
       and account_status='OPEN';
    spool off
    exit
EOO
    cat /tmp/username_list.tmp | grep -v ^$ > $expdp_dir/username_list.lst
    rm  /tmp/username_list.tmp

    ## if there is no application user
    if [ `cat ./username_list.lst | wc -l` -le 0 ];then
        echo "Instance $instance_name:there is no application user."
        continue
    fi
   
    ## for each user 
    mkdir ./dumpfiles
    chmod 755 dumpfiles
    for j in `cat ./username_list.lst`
    do
        username=`echo $j`
        mkdir -p ./scripts/$username
        chmod -R 755 ./scripts
    
        ################## 2.1 create expdp_user.sh    ##################
        ## create datapump directory
        echo "#!/bin/sh"								>> ./scripts/$username/expdp_$username.sh
        echo "su - $os_username <<EOO >/dev/null 2>&1"					>> ./scripts/$username/expdp_$username.sh
        echo "export ORACLE_SID=$instance_name"						>> ./scripts/$username/expdp_$username.sh
        echo "sqlplus -s '/ as sysdba' "						>> ./scripts/$username/expdp_$username.sh
        echo "create or replace directory datapump_scripts_dir as '$expdp_dir';"   	>> ./scripts/$username/expdp_$username.sh
        echo "exit"                                                                     >> ./scripts/$username/expdp_$username.sh
	echo "EOO" 									>> ./scripts/$username/expdp_$username.sh

        x=`echo $instance_name`_`echo $username`_`echo $expdp_date`
        dumpfile_name=`echo $x | tr a-z A-Z`

	echo "su - $os_username <<EOO >/dev/null 2>&1"					>> ./scripts/$username/expdp_$username.sh
        echo "export ORACLE_SID=$instance_name"						>> ./scripts/$username/expdp_$username.sh
        echo "expdp \'/ as sysdba\'  directory=datapump_scripts_dir schemas=$username dumpfile=$dumpfile_name.dmp logfile=`echo $dumpfile_name`_EXPDP.log job_name=EXPDP_$dumpfile_name content=metadata_only exclude=cluster,constraint,db_link,dimension,function,grant,job,package,procedure,sequence,statistics,synonym,trigger,user,view " 		>> ./scripts/$username/expdp_$username.sh
    	echo "EOO" 									>> ./scripts/$username/expdp_$username.sh
        
	## move the dump file
        echo "cd $expdp_dir "				   				>> ./scripts/$username/expdp_$username.sh
        echo "mv $dumpfile_name.dmp ./dumpfiles/ "		   			>> ./scripts/$username/expdp_$username.sh
        echo "mv `echo $dumpfile_name`_EXPDP.log ./dumpfiles/ " 			>> ./scripts/$username/expdp_$username.sh

        chmod 755 ./scripts/$username/expdp_$username.sh

        ################## 2.2 create impdp_user.sh    ##################
        ## query the tablespace of the user
        su - "${os_username}" <<EOO >/dev/null 2>&1
        export ORACLE_SID=$instance_name
        cd $expdp_dir
        sqlplus -s '/ as sysdba' 
        set pagesize 100 feedback off heading off linesize 180 trimspool on
        spool /tmp/expdp_tbs.tmp
        select distinct tablespace_name from dba_segments where owner = '$j'
        union
        select s.default_tablespace from dba_users  s where s.username='$j';
        spool off
        exit
EOO
        cat /tmp/expdp_tbs.tmp | grep -v ^$ > $expdp_dir/scripts/$username/expdp_tbs.lst
	rm  /tmp/expdp_tbs.tmp

        echo "#!/bin/sh"								>> ./dumpfiles/$dumpfile_name.sh  
        echo "### Note:execute this script only in serial mode. "			>> ./dumpfiles/$dumpfile_name.sh  
    
        ## check the directory
        echo "if ! [ -d $impdp_dir ];then"                                          	>> ./dumpfiles/$dumpfile_name.sh
        echo "$impdp_dir does not exists,please check the path."                    	>> ./dumpfiles/$dumpfile_name.sh
        echo "exit"                                                                 	>> ./dumpfiles/$dumpfile_name.sh
        echo "fi"                                                                   	>> ./dumpfiles/$dumpfile_name.sh
        echo "export ORACLE_SID=$impdp_instance_name"                                 	>> ./dumpfiles/$dumpfile_name.sh

        remap_tbs=''
        for i in `cat ./scripts/$username/expdp_tbs.lst`                 
        do                                           
           temp=$i:$impdp_default_tbs                      
           remap_tbs=$remap_tbs,$temp                 
        done                                             
        remap_tablespaces=`echo $remap_tbs | sed 's/ //g' | sed 's/,//'`
        rm  ./scripts/$username/expdp_tbs.lst

        echo "impdp $impdp_user/$impdp_password directory=datapump_scripts_dir schemas=$j dumpfile=$dumpfile_name.dmp logfile=`echo $dumpfile_name`_IMPDP.log remap_tablespace=$remap_tablespaces remap_schema=$j:$impdp_user"  >> ./dumpfiles/$dumpfile_name.sh
   
	chmod 755 ./dumpfiles/$dumpfile_name.sh

    done
    rm -r ./username_list.lst
 
    ################################### 3.create expdp_"${instance_name}".sh ################################### 
    echo "#/bin/sh"								>> ./scripts/expdp_"${instance_name}".sh
    echo "cd $expdp_dir"							>> ./scripts/expdp_"${instance_name}".sh
    echo "for i in \`ls -F ./scripts | grep '/$'\`"				>> ./scripts/expdp_"${instance_name}".sh
    echo "do"									>> ./scripts/expdp_"${instance_name}".sh
    echo "     cd $expdp_dir/scripts/\$i"					>> ./scripts/expdp_"${instance_name}".sh
    echo "     expdpsh=\`ls | grep expdp\`"					>> ./scripts/expdp_"${instance_name}".sh
    echo "     sh  \$expdpsh"							>> ./scripts/expdp_"${instance_name}".sh
    echo "done"									>> ./scripts/expdp_"${instance_name}".sh
    echo "cd $expdp_dir/dumpfiles"						>> ./scripts/expdp_"${instance_name}".sh
    echo "tar cvf `echo $expdp_date`_`echo $instance_name`.tar *.sh *.dmp *.log">> ./scripts/expdp_"${instance_name}".sh
    echo "ftp -v -n $ftp_ip <<EOF  |tee -a ${expdp_dir}/dumpfiles/${instance_name}_ftp.log" >> ./scripts/expdp_"${instance_name}".sh
    echo "user $ftp_user $ftp_password "					>> ./scripts/expdp_"${instance_name}".sh
    echo "prompt off"                                                           >> ./scripts/expdp_"${instance_name}".sh
    echo "binary"								>> ./scripts/expdp_"${instance_name}".sh
    echo "cd $ftp_dir "								>> ./scripts/expdp_"${instance_name}".sh
    echo "lcd $expdp_dir/dumpfiles"						>> ./scripts/expdp_"${instance_name}".sh
    echo "put `echo $expdp_date`_`echo $instance_name`.tar"			>> ./scripts/expdp_"${instance_name}".sh
    echo "bye |tee -a ${expdp_dir}/dumpfiles/${instance_name}_ftp.log"          >> ./scripts/expdp_"${instance_name}".sh
    echo "EOF"                                                                  >> ./scripts/expdp_"${instance_name}".sh
   
    echo "cd $expdp_dir/dumpfiles"						>> ./scripts/expdp_"${instance_name}".sh
    echo "rm  *.dmp *.sh *EXPDP.log *.tar "					>> ./scripts/expdp_"${instance_name}".sh
 
    chmod 755 ./scripts/expdp_"${instance_name}".sh

    ################################### 4.create expdp_all_instance.sh ################################### 
    echo "sh `echo $expdp_dir`/scripts/expdp_`echo $instance_name`.sh"          >> "${expdp_all_instance_dir}"/expdp_all_instance.sh

    chmod 777 "${expdp_all_instance_dir}"/expdp_all_instance.sh
done 


################################### 5.expdp all instances ################################### 
if [ -f "${expdp_all_instance_dir}"/expdp_all_instance.sh ];then
     sh "${expdp_all_instance_dir}"/expdp_all_instance.sh
fi

## delete expdp_all_instance.sh
rm -rf "${expdp_all_instance_dir}"/expdp_all_instance.sh


