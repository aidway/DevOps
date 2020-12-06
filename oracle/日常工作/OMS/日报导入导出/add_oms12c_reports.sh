#!/bin/sh

#################################################################################
##### Version  : 1.0
##### Function : Add daily/weekly report in oms12c repository.
#####            
##### Note  : Run the script by ORACLE user on oms12c repository database.
#####         
#################################################################################


## read the config
ISRAC=`cat ./oms12c_report_config | grep ISRAC= | awk  -F '=' '{print $2}'`
ALL_INSTANCE_NAME=`cat ./oms12c_report_config | grep INSTANCE_NAME= | awk  -F '=' '{print $2}'`
ALL_DAILY_NAME=`cat ./oms12c_report_config | grep DAILY_NAME= | awk  -F '=' '{print $2}'`
ALL_WEEKLY_NAME=`cat ./oms12c_report_config | grep WEEKLY_NAME= | awk  -F '=' '{print $2}'`
DB_NAME=`cat ./oms12c_report_config | grep DB_NAME= | awk  -F '=' '{print $2}'`


## login oms
cd /oms/middleware12c/oms/bin
./emcli login -username=sysman -password=sysman12


## export report
if [ $ISRAC = "N" ]; then
	./emcli export_report  -output_file=/arch/add_oms_reports/daily.xml.bak -owner=sysman -title='daily_single_report'
	./emcli export_report  -output_file=/arch/add_oms_reports/weekly.xml.bak -owner=sysman -title='weekly_single_report'
else
	./emcli export_report  -output_file=/arch/add_oms_reports/daily.xml.bak -owner=sysman -title='daily_rac_report'
	./emcli export_report  -output_file=/arch/add_oms_reports/weekly.xml.bak -owner=sysman -title='weekly_rac_report'
fi


## for each instance_name
t=1
echo $ALL_INSTANCE_NAME  | awk -F ',' '{k=1;while(k<=NF){print $k;k++}}' | while read k;
do
	INSTANCE_NAME=`echo $k`
	DAILY_NAME=`echo $ALL_DAILY_NAME | awk -F ',' '{print $'$t'}'`
	WEEKLY_NAME=`echo $ALL_WEEKLY_NAME | awk -F ',' '{print $'$t'}'`
		
	cp /arch/add_oms_reports/daily.xml.bak /arch/add_oms_reports/daily.xml
	cp /arch/add_oms_reports/weekly.xml.bak /arch/add_oms_reports/weekly.xml
	
	if [ $ISRAC = "N" ]; then
		sed -i "s/X   XX/$INSTANCE_NAME/g" /arch/add_oms_reports/daily.xml
		sed -i "s/daily_single_report/$DAILY_NAME/g" /arch/add_oms_reports/daily.xml
		sed -i "s/XXXXX/$INSTANCE_NAME/g" /arch/add_oms_reports/weekly.xml
		sed -i "s/weekly_single_report/$WEEKLY_NAME/g" /arch/add_oms_reports/weekly.xml
	else
		sed -i "s/XXXXX/$DB_NAME/g" /arch/add_oms_reports/daily.xml
		sed -i "s/YYYYY/$INSTANCE_NAME/g" /arch/add_oms_reports/daily.xml
		sed -i "s/daily_rac_report/$DAILY_NAME/g" /arch/add_oms_reports/daily.xml
		sed -i "s/XXXXX/$DB_NAME/g" /arch/add_oms_reports/weekly.xml
		sed -i "s/YYYYY/$INSTANCE_NAME/g" /arch/add_oms_reports/weekly.xml
		sed -i "s/weekly_rac_report/$WEEKLY_NAME/g" /arch/add_oms_reports/weekly.xml
	fi
	
	./emcli import_report -files=/arch/add_oms_reports/daily.xml
	./emcli import_report -files=/arch/add_oms_reports/weekly.xml
		
	t=`expr $t + 1`
done

cd /oms/middleware12c/oms/bin
./emcli logout

