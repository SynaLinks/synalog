SELECT * FROM (
  
    SELECT
      x_3 AS x
    FROM
      UNNEST(ARRAY[1, 2, 3, 4]) as x_3
    WHERE
      (x_3 > 0) AND
      (x_3 < 2)
   UNION ALL
  
    SELECT
      4 AS x
    FROM
      UNNEST(ARRAY[1, 2, 3, 4]) as x_3
    WHERE
      (x_3 = 4)
  
) AS UNUSED_TABLE_NAME  ORDER BY x ;