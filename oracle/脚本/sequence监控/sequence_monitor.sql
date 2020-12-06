#!/bin/sh

###############################################
##
## Run the script by ROOT
##
## The character '$' of the sequence name will be replaced by '#',
## So,if there are two sequences named like 'SEQ$' and 'SEQ#',there may be an error in the result of the script.
##
###############################################

## for each instance
ps -ef|grep [o]ra_smon|awk 'sub(/ora_smon_/,"",$NF){print $1,$NF}' | while read i;
do    
    os_username=`echo ${i}|awk '{print $1}'`
    instance_name=`echo ${i}|awk '{print $2}'`
	
	
	## get start_time and end_time
	echo `date  +"%Y-%m-%d %H:%M:%S"` > /tmp/end_time_${instance_name}.bak
	if ! [ -f /tmp/start_time_${instance_name}.bak ];then
		cp /tmp/end_time_${instance_name}.bak  /tmp/start_time_${instance_name}.bak
	fi
	start_time=`cat /tmp/start_time_${instance_name}.bak`
	end_time=`cat /tmp/end_time_${instance_name}.bak`
 
	
	## get time_elapsed_delta and sequence info 
 	su - "${os_username}" <<EOF >/dev/null 2>&1
    export ORACLE_SID=$instance_name
    sqlplus -S '/ as sysdba' 
    set pagesize 0 feedback off heading off linesize 200 trimspool on
	
	spool /tmp/time_elapsed_delta_${instance_name}.bak
	select (to_date('$end_time','yyyy-mm-dd hh24:mi:ss')-to_date('$start_time','yyyy-mm-dd hh24:mi:ss'))*24*60*60 from dual;	
 	spool off
	
	spool /tmp/end_sequence_${instance_name}.bak
	select s.sequence_owner || ':' || s.sequence_name || ';' || s.last_number || ';' || s.max_value
	  from dba_sequences s
     where s.sequence_owner not like  'QUERY\_%' escape '\'
	   and s.sequence_owner not in
           ('MONITOR','SYS','SYSTEM','DIP','TSMSYS','ORDSYS',
            'SCOTT','DBSNMP','ORACLE_OCM','OUTLN','SQLTXPLAIN','WMSYS','CTXSYS',
            'APPQOSSYS','SI_INFORMTN_SCHEMA','XDB','PERFSTAT','ACCOUNT','ANONYMOUS','DMSYS',
            'EXFSYS','MDDATA','MDSYS','OLAPSYS','ORDPLUGINS','OGG','DBVIEW'); 
	spool off
    exit;
EOF
	
	## if this script runs for the first time
	if ! [ -f /tmp/start_sequence_${instance_name}.bak ];then
		cp /tmp/end_sequence_${instance_name}.bak  /tmp/start_sequence_${instance_name}.bak
		cp /tmp/end_time_${instance_name}.bak  /tmp/start_time_${instance_name}.bak
		echo "Primary|9999999|$instance_name|All app sequences are ok."
		continue;
	fi	
	
	## for each sequence
	time_elapsed_delta=`cat /tmp/time_elapsed_delta_${instance_name}.bak`	
	
	if [ $time_elapsed_delta -eq 0 ];then
		echo "Primary|9999999|$instance_name|Time elapsed delta is zero."
		cnt=9999999
		continue;
	fi
 
	cnt=0
    for j in `cat /tmp/end_sequence_${instance_name}.bak`
    do
		seq_name=`echo $j | awk -F ';' '{print $1}'`
		seq_name_modified=`echo $seq_name | sed 's/\\$/#/g'`
		end_last_number=`echo $j | awk -F ';' '{print $2}'`
		end_max_value=`echo $j | awk -F ';' '{print $3}'`
		seq_info=${instance_name}:${seq_name}
		
		## if the sequence exists in the end_sequence.bak but not in the start_sequence.bak
		if [ `cat /tmp/start_sequence_${instance_name}.bak | sed 's/\\$/#/g' | grep -w $seq_name_modified | wc -l` -eq 0 ];then
			continue;
		fi
	
		start_last_number=`cat /tmp/start_sequence_${instance_name}.bak | sed 's/\\$/#/g' | grep -w $seq_name_modified  | awk -F ';' '{print $2}'`
		
		seq_per_second=`echo "scale=2;($end_last_number-$start_last_number)/$time_elapsed_delta " | bc -l`
		used_rate=`echo "scale=2;$end_last_number/$end_max_value*100 " | bc -l`
		
		if [ `echo "scale=0;0-$seq_per_second" | bc -l | grep - | wc -l` -gt 0 ];then
			left_time=`echo "scale=0;($end_max_value-$end_last_number)/$seq_per_second " | bc -l`
	
			if [ `echo "scale=0;$left_time-99999" | bc -l | grep - | wc -l` -gt 0 ];then
				echo "Primary|$left_time|$seq_info|$seq_info left_time=${left_time}s used_rate=$used_rate%"
				cnt=` expr $cnt + 1 `
			fi
		elif [ `echo "scale=0;$end_max_value-$end_last_number " | bc -l | grep - | wc -l` -gt 0  ];then
			echo "Primary|0|$seq_info|$seq_info left_time=0s used_rate=100%"
			cnt=` expr $cnt + 1 `
		fi
  	done
	
	
	## if no app sequence
	if [ `cat /tmp/end_sequence_${instance_name}.bak | wc -l` -eq 0 ];then
		echo "Primary|9999999|$instance_name|No app sequence."
	elif [ $cnt -eq 0 ];then
		echo "Primary|9999999|$instance_name|All app sequences are ok."
	fi
	
	cp /tmp/end_sequence_${instance_name}.bak  /tmp/start_sequence_${instance_name}.bak
	cp /tmp/end_time_${instance_name}.bak  /tmp/start_time_${instance_name}.bak

done

## Standby server
if [ `ps -ef | grep ora_ | grep smon | wc -l` -le 0 ];then
	echo "Standby|9999999|NA|Standby server."
fi
