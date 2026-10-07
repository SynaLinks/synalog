SELECT * FROM (
  
    SELECT
      x_3 AS x
    FROM
      UNNEST(ARRAY[1]) as x_3
   UNION ALL
  
    SELECT
      x_3 AS x
    FROM
      UNNEST(ARRAY[2]) as x_3
  
) AS UNUSED_TABLE_NAME  ORDER BY x ;