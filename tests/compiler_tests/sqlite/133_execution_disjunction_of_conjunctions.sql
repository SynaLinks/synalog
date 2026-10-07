SELECT * FROM (
  
    SELECT
      x_3.value AS x
    FROM
      JSON_EACH(JSON_ARRAY(1, 2, 3, 4)) as x_3
    WHERE
      (x_3.value > 0) AND
      (x_3.value < 2)
   UNION ALL
  
    SELECT
      4 AS x
    FROM
      JSON_EACH(JSON_ARRAY(1, 2, 3, 4)) as x_3
    WHERE
      (x_3.value = 4)
  
) AS UNUSED_TABLE_NAME  ORDER BY x ;