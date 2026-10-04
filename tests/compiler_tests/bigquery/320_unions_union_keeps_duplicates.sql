WITH t_0_U AS (SELECT * FROM (
  
    SELECT
      x_1 AS x
    FROM
      UNNEST(ARRAY[1, 2]) as x_1
   UNION ALL
  
    SELECT
      x_3 AS x
    FROM
      UNNEST(ARRAY[2, 3]) as x_3
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_0_U AS U;