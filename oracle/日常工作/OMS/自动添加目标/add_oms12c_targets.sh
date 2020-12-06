 #!/bin/sh
 
#################################################################################
##### Version  : 1.1
##### Function : Add oms12c targets,include oracle_database¡¢oracle_listener¡¢rac_database¡¢cluster osm_cluster  
#####            
##### Note  : Run the script by ORACLE user on oms12c repository database.
#####         The status of oms12c agents should be Running.
#################################################################################

######## read config file
ISRAC=`cat ./oms12c_target_config | grep ISRAC= | awk  -F '=' '{print $2}'`
ALL_HOSTNAME=`cat ./oms12c_target_config | grep HOSTNAME= | awk  -F '=' '{print $2}'`
ALL_PHYSICAL_IP=`cat ./oms12c_target_config | grep PHYSICAL_IP= | awk  -F '=' '{print $2}'`
FLOATING_IP=`cat ./oms12c_target_config | grep FLOATING_IP= | awk  -F '=' '{print $2}'`
ORACLE_HOME=`cat ./oms12c_target_config | grep ORACLE_HOME= | awk  -F '=' '{print $2}'`
ALL_INSTANCE_NAME=`cat ./oms12c_target_config | grep INSTANCE_NAME= | awk  -F '=' '{print $2}'`
ALL_DB_LISTENER_PORT=`cat ./oms12c_target_config | grep DB_LISTENER_PORT= | awk  -F '=' '{print $2}'`
ALL_DB_LISTENER_NAME=`cat ./oms12c_target_config | grep DB_LISTENER_NAME= | awk  -F '=' '{print $2}'`
OMS_LISTNER_PORT=`cat ./oms12c_target_config | grep OMS_LISTNER_PORT= | awk  -F '=' '{print $2}'`
OMS_LISTENER_NAME=`cat ./oms12c_target_config | grep OMS_LISTENER_NAME= | awk  -F '=' '{print $2}'`
LISTENER_HOME=$ORACLE_HOME/network/admin


####### login oms
cd /oms/middleware12c/oms/bin
./emcli login -username=sysman -password=sysman12

## for each instance_name
t=1
echo $ALL_INSTANCE_NAME  | awk -F ',' '{k=1;while(k<=NF){print $k;k++}}' | while read k;
do
	INSTANCE_NAME=`echo $k`
	DB_LISTENER_PORT=`echo $ALL_DB_LISTENER_PORT | awk -F ',' '{print $'$t'}'`
	DB_LISTENER_NAME=`echo $ALL_DB_LISTENER_NAME | awk -F ',' '{print $'$t'}'`
	
	
    ## for each host
    j=1
    echo $ALL_HOSTNAME  | awk -F ',' '{i=1;while(i<=NF){print $i;i++}}' | while read i;
    do
        HOSTNAME=`echo $i`
        PHYSICAL_IP=`echo $ALL_PHYSICAL_IP | awk -F ',' '{print $'$j'}'`
        
		cd /oms/middleware12c/oms/bin
		./emcli add_target -name="listener_${INSTANCE_NAME}_${HOSTNAME}_oms" -type="oracle_listener" -host="${HOSTNAME}-oms" -properties="LsnrName:${DB_LISTENER_NAME};ListenerOraDir:${LISTENER_HOME};Port:${DB_LISTENER_PORT};OracleHome:${ORACLE_HOME};Machine:${FLOATING_IP}"
		
		if [ $t -eq 1 ];then
			./emcli add_target -name="listener_oms_${HOSTNAME}_oms" -type="oracle_listener" -host="${HOSTNAME}-oms" -properties="LsnrName:${OMS_LISTENER_NAME};ListenerOraDir:${LISTENER_HOME};Port:${OMS_LISTNER_PORT};OracleHome:${ORACLE_HOME};Machine:${PHYSICAL_IP}"
		fi
		
		./emcli add_target -name="${INSTANCE_NAME}_${HOSTNAME}_oms" -type="oracle_database" -host="${HOSTNAME}-oms" -credentials="UserName:dbsnmp;password:dbsnmp;Role:Normal" -properties="SID:${INSTANCE_NAME};Port:${OMS_LISTNER_PORT};OracleHome:${ORACLE_HOME};MachineName:${PHYSICAL_IP}"
		
		j=`expr $j + 1`
    done
	
	t=`expr $t + 1`
done

####### logout oms
cd /oms/middleware12c/oms/bin
./emcli logout

