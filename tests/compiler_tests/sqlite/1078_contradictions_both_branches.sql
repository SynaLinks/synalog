SELECT * FROM (
  
    SELECT
      1 AS x
    FROM
      JSON_EACH(JSON_ARRAY(1, 2)) as x_3
    WHERE
      (1 > 5) AND
      (x_3.value = 1)
   UNION ALL
  
    SELECT
      1 AS x
    FROM
      JSON_EACH(JSON_ARRAY(1, 2)) as x_3
    WHERE
      (1 < 0) AND
      (x_3.value = 1)
  
) AS UNUSED_TABLE_NAME  ;