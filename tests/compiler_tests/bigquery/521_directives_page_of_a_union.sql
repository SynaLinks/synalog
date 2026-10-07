SELECT * FROM (
  
    SELECT
      x_1 AS x
    FROM
      UNNEST(ARRAY[1, 3]) as x_1
   UNION ALL
  
    SELECT
      x_1 AS x
    FROM
      UNNEST(ARRAY[2, 4]) as x_1
  
) AS UNUSED_TABLE_NAME  ORDER BY x ;