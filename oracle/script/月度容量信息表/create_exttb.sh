#/bin/sh

##########################################
####
#### create external table
####
##########################################

mkdir /arch/monthly_report

sqlplus -s / as sysdba <<EOF
create or replace directory exttab_monthly_report_dir as '/arch/monthly_report';
grant read,write on directory exttab_monthly_report_dir to sysman;
create table sysman.p_monthly_cap
   (DB_NAME        VARCHAR2(10),
     CAPA_NAME        VARCHAR2(210),
     SMONTH           VARCHAR2(10),
     AVG_VALUE        NUMBER,
     AVG_LRRATIO      NUMBER,
     MAX_VALUE        NUMBER,
     MAX_LRRATIO      NUMBER
   )
    organization external
    (type oracle_loader
     default directory exttab_monthly_report_dir
     access parameters
       (records delimited by newline
        CHARACTERSET UTF8
	  nobadfile
          nologfile
        fields terminated by ","  LRTRIM
        reject rows with all null fields  
       )
     location ('p_monthly_cap.dat')
    );
create table sysman.p_monthly_space
   (
 	DB_NAME               VARCHAR2(10),
 	DB_ID                 number,
 	DB_ROLE               VARCHAR2(40),
 	TABLESPACE_NAME       VARCHAR2(30),
 	MONTH_NAME            VARCHAR2(10),
 	CHECK_TIME            date,
 	TBS_SIZE_MB           number,
 	FREE_SIZE_MB          number,
 	MONTH_INC_MB          number,
 	USED_PCT              number,
 	CHECKCNT             number,
 	EM2F                  number,
 	EM2W                  number
   )
    organization external
    (type oracle_loader
     default directory exttab_monthly_report_dir
     access parameters
       (records delimited by newline
	  nobadfile
          nologfile
        fields terminated by ","  LRTRIM
        reject rows with all null fields  
       )
     location ('p_monthly_space.dat')
    );
EOF


###########################################################################
#alter table sysman.p_monthly_cap reject limit unlimited;

#REJECT LIMIT UNLIMITED

# 呈现元素时出错。异常错误: ORA-29913: 执行 ODCIEXTTABLEFETCH 调出时出错 ORA-30653: 已达到拒绝限制值 
 

