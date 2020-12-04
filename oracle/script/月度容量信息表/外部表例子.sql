create table smdb.peizhiinfo_waibu
   (  
    HOSTNAME                       VARCHAR2(100) ,
    DATETIME                       DATE ,
    APPSYSTEM                      VARCHAR2(100),
    DISASTERTYPE                   VARCHAR2(100),
    APPTYPE                        VARCHAR2(100),
    F_IP                           VARCHAR2(200),
    MASTER_CIRCUM                  VARCHAR2(100),
    LEVELS                         VARCHAR2(10)
   )
    organization external
    (type oracle_loader
     default directory exttab_hostinfo_datalog_dir
     access parameters
       (records delimited by newline
        nobadfile
        nologfile
        fields terminated by "|"  
        missing field values are null
        (HOSTNAME,
        DATETIME  date "YYYY-MM-DD",
        APPSYSTEM,
        DISASTERTYPE,
        APPTYPE,
        F_IP,
        MASTER_CIRCUM,
        LEVELS
        ) 
       )
     location ('peizhiinfo.log')
    );


-- 
注：没有加粗部分时，查不到数据。
