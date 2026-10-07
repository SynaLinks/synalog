SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ORDER BY x ;