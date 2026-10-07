WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'x' AS g,
      'a' AS n,
      1 AS s
   UNION ALL
  
    SELECT
      'x' AS g,
      'b' AS n,
      2 AS s
   UNION ALL
  
    SELECT
      'y' AS g,
      'c' AS n,
      7 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  (ARRAY_AGG(V.n order by V.s desc))[1] AS w
FROM
  t_1_V AS V
GROUP BY 1 ORDER BY g;