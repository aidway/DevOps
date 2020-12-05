select client_name, status from dba_autotask_client;

select client_name, status from dba_autotask_client;

-- ¹Ø±Õauto space advisor
begin
dbms_auto_task_admin.disable (
client_name = 'auto space advisor',
operation = NULL,
window_name = NULL);
end;




-- ¿ªÆôauto space advisor
begin
dbms_auto_task_admin.enable (
client_name = 'auto space advisor',
operation = NULL,
window_name = NULL);
end;


