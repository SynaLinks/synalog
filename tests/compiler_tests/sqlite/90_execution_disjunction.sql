SELECT * FROM (
  
    SELECT
      1 AS x
    FROM
      JSON_EACH(JSON_ARRAY(1, 3, 5)) as x_3
    WHERE
      (x_3.value = 1)
   UNION ALL
  
    SELECT
      5 AS x
    FROM
      JSON_EACH(JSON_ARRAY(1, 3, 5)) as x_3
    WHERE
      (x_3.value = 5)
  
) AS UNUSED_TABLE_NAME  ORDER BY x ;