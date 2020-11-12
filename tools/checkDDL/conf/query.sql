-- 查询分桶信息
SELECT a.database_name,
       a.table_name,
       a.bucket_column,
       a.bucket_number,
       trunc(b.table_size) 'table_size(M)',
       trunc(b.table_size / bucket_number) AS 'per_bucket_size(M)'
  FROM system.buckets_v a
 INNER JOIN (SELECT database_name,
                    table_name,
                    to_number(property_value) / 1024 / 1024 AS table_size
               FROM system.table_properties_v
              WHERE property_key = 'totalSize') b
    ON a.database_name = b.database_name
   AND a.table_name = b.table_name
 WHERE a.database_name = 'TDH_DBNAME'
 ORDER BY trunc(b.table_size / bucket_number) DESC LIMIT 100;



F_CBS_AZJCPH_east 