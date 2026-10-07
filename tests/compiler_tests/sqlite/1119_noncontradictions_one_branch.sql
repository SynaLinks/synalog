SELECT * FROM (
  
    SELECT
      x_3.value AS x
    FROM
      JSON_EACH(JSON_ARRAY(1, 5, 9)) as x_3
    WHERE
      (x_3.value < 3) AND
      (x_3.value != 1)
   UNION ALL
  
    SELECT
      x_3.value AS x
    FROM
      JSON_EACH(JSON_ARRAY(1, 5, 9)) as x_3
    WHERE
      (x_3.value > 7) AND
      (x_3.value != 1)
  
) AS UNUSED_TABLE_NAME  ;