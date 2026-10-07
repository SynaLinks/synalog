SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      x_1 AS x
    FROM
      UNNEST(ARRAY[2]) as x_1
    WHERE
      (x_1 > 5)
  
) AS UNUSED_TABLE_NAME  ;