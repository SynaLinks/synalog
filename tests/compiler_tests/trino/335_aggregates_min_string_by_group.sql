WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS g,
      'cat' AS s
   UNION ALL
  
    SELECT
      1 AS g,
      'ant' AS s
   UNION ALL
  
    SELECT
      2 AS g,
      'bee' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  MIN(V.s) AS m
FROM
  t_0_V AS V
GROUP BY 1 ORDER BY g;