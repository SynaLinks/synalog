WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      5 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      6 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      7 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  SUM(CASE WHEN (V.x > 4) THEN 1 ELSE 0 END) AS n
FROM
  t_0_V AS V
GROUP BY 1 ORDER BY g;