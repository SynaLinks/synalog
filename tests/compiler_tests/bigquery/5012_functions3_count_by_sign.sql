WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      3 AS x,
      "ab" AS s
   UNION ALL
  
    SELECT
      2 AS k,
      -4 AS x,
      "hello" AS s
   UNION ALL
  
    SELECT
      3 AS k,
      0 AS x,
      "" AS s
   UNION ALL
  
    SELECT
      4 AS k,
      null AS x,
      "x" AS s
   UNION ALL
  
    SELECT
      5 AS k,
      12 AS x,
      null AS s
   UNION ALL
  
    SELECT
      6 AS k,
      7 AS x,
      "seven" AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  CASE WHEN (V.x > 0) THEN 1 WHEN (V.x < 0) THEN -1 ELSE 0 END AS g,
  SUM(1) AS n
FROM
  t_0_V AS V
GROUP BY g ORDER BY g;