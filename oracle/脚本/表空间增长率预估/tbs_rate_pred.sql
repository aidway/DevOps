/*
说明：使用 线性回归 方法预估表空间增长速度
version:v1.2
date： 2016-3-16
*/
declare
  type record_args_data is record(
    instance_name   varchar2(20),
    tablespace_name varchar2(20),
    sum_xy          number,
    sum_x           number,
    sum_y           number,
    sum_xx          number,
    sum_yy          number,
    avg_x           number,
    avg_y           number,
    max_x           number,
    n               number,
    a               number,
    b               number,
    r               number,
    rest_time_hours number);
  type table_args_data is table of record_args_data index by binary_integer;
  var1                     table_args_data;
  threshold_value_alert    number;
  threshold_value_relative number;
  sampling_days            number;
  sum_delta_y              number;
  sampling_sysdate         date;

begin
  threshold_value_alert    := 80;
  threshold_value_relative := 0.6;
  sampling_days            := 10;

  select sysdate into sampling_sysdate from dual;

  select (select instance_name
            from MGMT$DB_DBNINSTANCEINFO d
           where d.TARGET_NAME = c.target_name) instance_name,
         key_value tablespace_name,
         sum(x * y) sum_xy,
         sum(x) sum_x,
         sum(y) sum_y,
         sum(x * x) sum_xx,
         sum(y * y) sum_yy,
         avg(x) avg_x,
         avg(y) avg_y,
         max(x) max_x,
         count(*) n,
         0 a,
         0 b,
         0 r,
         999999 rest_time_hours bulk collect
    into var1
    from (select a.target_name,
                 a.key_value,
                 a.value y,
                 a.collection_timestamp - sampling_sysdate + sampling_days x
            from sysman.mgmt$metric_details a
           where a.target_type = 'oracle_database'
             and a.metric_label = 'Tablespaces Full'
             and a.column_label = 'Tablespace Space Used (%)'
             and a.collection_timestamp > sampling_sysdate - sampling_days
             ) c
   group by c.target_name, c.key_value
   order by c.target_name;

  for i in 1 .. var1.count loop
    sum_delta_y := sqrt(var1(i).sum_yy - 2 * var1(i).avg_y * var1(i).sum_y + var1(i)
                        .n * power(var1(i).avg_y, 2));
    var1(i).b := (var1(i).n * var1(i).sum_xy - var1(i).sum_x * var1(i).sum_y) /
                 (var1(i).n * var1(i).sum_xx - power(var1(i).sum_x, 2));
    var1(i).a := var1(i).avg_y - var1(i).b * var1(i).avg_x;
    if sum_delta_y = 0 then
      var1(i).r := 1;
    else
      var1(i).r := round((var1(i).sum_xy - var1(i).avg_y * var1(i).sum_x - var1(i)
                         .avg_x * var1(i).sum_y + var1(i)
                         .n * var1(i).avg_x * var1(i).avg_y) /
                         (sqrt(var1(i)
                               .sum_xx - 2 * var1(i).avg_x * var1(i).sum_x + var1(i)
                               .n * power(var1(i).avg_x, 2)) * sum_delta_y),
                         5);
    end if;
  
    if var1(i).r >= threshold_value_relative then
      if var1(i).b = 0 then
        var1(i).rest_time_hours := 99999;
      else
        var1(i).rest_time_hours := round(((threshold_value_alert - var1(i).a) / var1(i).b - var1(i)
                                         .max_x) * 24,
                                         2);
      end if;
      end if;
    dbms_output.put_line( var1(i)
                         .instance_name || ',' || var1(i).tablespace_name ||
                         ', =D1*' || var1(i).b || '+' || var1(i).a || ' ,' || var1(i).r);
  end loop;
exception
  when ZERO_DIVIDE then
    dbms_output.put_line(sqlerrm);
end;
/


