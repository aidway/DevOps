#!/bin/sh


#########################################################################################################
#
# Description:The script is used to forecast how long the archive space will be exhausted.
# Version:3.0
# Date:2016-2-16
# OS:linux¡¢aix¡¢hp-ux
#
#########################################################################################################



# sampling interval,unit:hour
interval=0.1

## for each instance
ps -ef|grep [Oo]ra_smon >/dev/null 2>&1
if [ $? -eq 0 ];then
ps -ef|grep [o]ra_smon|awk 'sub(/ora_smon_/,"",$NF){print $1,$NF}' | while read i;
do    
    os_username=`echo ${i}|awk '{print $1}'`
    instance_name=`echo ${i}|awk '{print $2}'`

    TARGET=\'PRIMARY\'
    STATUS=\'VALID\' 
    su - "${os_username}" <<EOF >/dev/null 2>&1
    export ORACLE_SID=$instance_name
    sqlplus -S '/ as sysdba' 
    set pagesize 100 feedback off heading off linesize 180 trimspool on
    spool /tmp/archcnt.tmp
    select count(*) cnt  from v\$archived_log s where s.completion_time >= sysdate - 1/24 * $interval; 
    spool off
    spool /tmp/archlogsize_mb.tmp
    select nvl(max(round(s.blocks * s.block_size / 1024 / 1024)), 0)
      from v\$archived_log s
     where s.completion_time >= sysdate - 1 / 24 * $interval;
    spool off
    spool /tmp/archdest.tmp
    select s.DESTINATION from v\$archive_dest s where s.TARGET = $TARGET and s.STATUS = $STATUS;
    spool off
    spool /tmp/israc.tmp
    select value from v\$option s where s.PARAMETER='Real Application Clusters';
    spool off
    exit;
EOF

    # archive counts in two hours
    archcnt=`cat /tmp/archcnt.tmp | grep -v ^$`
    # archive log size 
    archlogsize_mb=`cat /tmp/archlogsize_mb.tmp | grep -v ^$`
    # archive log dest
    archdest=`cat /tmp/archdest.tmp | grep -v ^$ | sed 's*/*#*g'`
    # is rac or not
    israc=`cat /tmp/israc.tmp | grep -v ^$`

    rm -rf /tmp/archcnt.tmp
    rm -rf /tmp/archlogsize_mb.tmp
    rm -rf /tmp/archdest.tmp
    rm -rf /tmp/israc.tmp

    # archive dest free size
    archfreesize=0
    if [ $israc = 'TRUE' ];then
        su - "${os_username}" <<EOF >/dev/null 2>&1
        export ORACLE_SID=$instance_name
        sqlplus -S '/ as sysdba' 
        set pagesize 100 feedback off heading off linesize 180 trimspool on
        spool /tmp/racfreesize.tmp
        select b.FREE_MB*1024
          from v\$archive_dest a, v\$asm_diskgroup b
         where a.target = 'PRIMARY'
           and a.status = 'VALID'
           and substr(a.DESTINATION,2,length(a.DESTINATION)) = b.name;
        spool off
        exit
EOF
        archfreesize=`cat /tmp/racfreesize.tmp | grep -v ^$`
    else
        os=`uname`
        for t in `awk 'BEGIN {len=split('"\"$archdest\""',arr,"#");
              for (i=1;i<len;i++)
              {
                 dir=""
                 for (j=2;j<=len-i+1;j++)
                 {
                    dir=dir "/"arr[j]
                 }
                 print dir  
              }
            }'`
        do
            if [ `df -kP | grep $t | wc -l` -gt 0 ];then
               if [ $os = HP-UX ]; then
                   archfreesize=`df -k $t | sed -n '2p' | awk '{print $1}'`
               elif [ $os = AIX ]; then
                   archfreesize=`df -k $t | sed -n '2p' | awk '{print $3}'`
               else 
                   archfreesize=`df -k $t | sed -n '2p' | awk '{print $4}'`
               fi
               break
            fi
        done
    fi

    if [ $archcnt -gt 0 ];then
        minutes=`echo "scale=0;$archfreesize * 60 / 1024 / $archlogsize_mb / $archcnt " | bc -l`
        echo "Primary|Have archived log in $interval hours|$minutes|$instance_name"
    else
        echo "Primary|There is no archived log in $interval hours|9999|$instance_name"
    fi
    
done

else 
        echo "Standby|There is no oracle process running|9999|NULL"
fi







