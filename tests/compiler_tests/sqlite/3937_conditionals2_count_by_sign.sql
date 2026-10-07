WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      5 AS x,
      'a' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      -3 AS x,
      null AS s
   UNION ALL
  
    SELECT
      3 AS k,
      0 AS x,
      'c' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      null AS x,
      'd' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      12 AS x,
      null AS s
   UNION ALL
  
    SELECT
      6 AS k,
      7 AS x,
      'f' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  CASE WHEN (V.x IS null) THEN null WHEN (V.x > 0) THEN 1 WHEN (V.x < 0) THEN -1 ELSE 0 END AS g,
  SUM(1) AS n
FROM
  t_0_V AS V
GROUP BY CASE WHEN (V.x IS null) THEN null WHEN (V.x > 0) THEN 1 WHEN (V.x < 0) THEN -1 ELSE 0 END ORDER BY g;