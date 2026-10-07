WITH t_2_V AS (SELECT * FROM (
  
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
  t_0_V.k AS k,
  CASE WHEN (((((((((((t_0_V.x) + (1))) + (1))) - (2))) + (t_0_V.x))) - (5)) > 0) THEN 1 WHEN (((((((((((t_0_V.x) + (1))) + (1))) - (2))) + (t_0_V.x))) - (5)) < 0) THEN -1 ELSE 0 END AS v
FROM
  t_2_V AS t_0_V ORDER BY k NULLS LAST;