WITH t_1_X AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      7 AS x
   UNION ALL
  
    SELECT
      2 AS k,
      -7 AS x
   UNION ALL
  
    SELECT
      3 AS k,
      2.5 AS x
   UNION ALL
  
    SELECT
      4 AS k,
      -2.5 AS x
   UNION ALL
  
    SELECT
      5 AS k,
      0 AS x
   UNION ALL
  
    SELECT
      6 AS k,
      null AS x
   UNION ALL
  
    SELECT
      7 AS k,
      0.1 AS x
   UNION ALL
  
    SELECT
      8 AS k,
      -0.75 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  CASE WHEN (t_0_X.x > 0) THEN 1 WHEN (t_0_X.x < 0) THEN -1 ELSE 0 END AS s,
  SUM(t_0_X.x) AS t
FROM
  t_1_X AS t_0_X
GROUP BY CASE WHEN (t_0_X.x > 0) THEN 1 WHEN (t_0_X.x < 0) THEN -1 ELSE 0 END ORDER BY s NULLS LAST;