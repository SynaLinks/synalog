SELECT * FROM (
  
    SELECT
      3 AS x
    FROM
      UNNEST(ARRAY[1, 3, 7]) as x_3
    WHERE
      (3 < 0) AND
      (x_3 = 3)
   UNION ALL
  
    SELECT
      3 AS x
    FROM
      UNNEST(ARRAY[1, 3, 7]) as x_3
    WHERE
      (3 > 1) AND
      (x_3 = 3)
  
) AS UNUSED_TABLE_NAME  ;