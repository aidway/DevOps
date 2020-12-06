sqlplus -s / as sysdba <<EOF
create or replace synonym "MGMT_VIEW"."P_MONTHLY_SPACE" for "SYSMAN"."P_MONTHLY_SPACE";
create or replace synonym "MGMT_VIEW"."P_MONTHLY_CAP" for "SYSMAN"."P_MONTHLY_CAP";
grant read,write on directory exttab_monthly_report_dir to mgmt_view;
grant select on sysman.p_monthly_space to mgmt_view;
grant select on sysman.p_monthly_cap to mgmt_view; 
EOF
