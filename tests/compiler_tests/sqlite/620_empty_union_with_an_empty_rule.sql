SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      x_1.value AS x
    FROM
      JSON_EACH(JSON_ARRAY(2)) as x_1
    WHERE
      (x_1.value > 5)
  
) AS UNUSED_TABLE_NAME  ;