SELECT * FROM (
  
    SELECT
      1 AS x
    FROM
      UNNEST(ARRAY[1, 2]) as pushkin(x_3)
    WHERE
      (1 > 5) AND
      (x_3 = 1)
   UNION ALL
  
    SELECT
      1 AS x
    FROM
      UNNEST(ARRAY[1, 2]) as pushkin(x_3)
    WHERE
      (1 < 0) AND
      (x_3 = 1)
  
) AS UNUSED_TABLE_NAME  ;