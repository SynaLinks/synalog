SELECT * FROM (
  
    SELECT
      x_1.value AS x
    FROM
      JSON_EACH(JSON_ARRAY(1, 3)) as x_1
   UNION ALL
  
    SELECT
      x_1.value AS x
    FROM
      JSON_EACH(JSON_ARRAY(2, 4)) as x_1
  
) AS UNUSED_TABLE_NAME  ORDER BY x ;