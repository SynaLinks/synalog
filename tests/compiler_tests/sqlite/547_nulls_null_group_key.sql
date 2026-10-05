WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      null AS g,
      1 AS x
   UNION ALL
  
    SELECT
      null AS g,
      2 AS x
   UNION ALL
  
    SELECT
      1 AS g,
      3 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  SUM(1) AS n
FROM
  t_0_V AS V
GROUP BY V.g ORDER BY g nulls first;