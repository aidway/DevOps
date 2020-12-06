declare
    interval number;
    archfreesize number;
    archlogsize_mb number;
    archcnt number;
    estimate_minutes  number(20,2);
begin
    interval := 2;
    -- query archive counts in two hours
    select count(*) into archcnt  
      from v$archived_log s 
     where s.completion_time >= sysdate - 1/24 * interval; 
     
    -- query archive log size
    select nvl(max(round(s.blocks * s.block_size / 1024 / 1024)), 0) into archlogsize_mb
      from v$archived_log s
     where s.completion_time >= sysdate - 1 / 24 * interval;
     
    -- query arch free bytes
    select free_bytes into archfreesize
      from cebdb_arch_space_info s;
    
    if (archcnt <= 0) then
      estimate_minutes := 9999999;
      --dbms_output.put_line(9999999);
    else
      estimate_minutes := archfreesize /1024 / 1024 / archlogsize_mb / archcnt * 60;
      --dbms_output.put_line(estimate_minutes);
    end if; 
      
    open :1 for select  estimate_minutes from dual;
    exception
      when no_data_found then
      dbms_output.put_line(sqlcode);
      dbms_output.put_line(sqlerrm);
end;

