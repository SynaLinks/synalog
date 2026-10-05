WITH t_0_U AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      x_2 AS x
    FROM
      UNNEST(ARRAY[1]) as pushkin(x_2)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_0_U AS U;