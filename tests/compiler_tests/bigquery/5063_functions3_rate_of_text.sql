WITH t_1_V AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_2_Rate AS (SELECT * FROM (
  
    SELECT
      "ab" AS s,
      2 AS r
   UNION ALL
  
    SELECT
      "hello" AS s,
      5 AS r
   UNION ALL
  
    SELECT
      "x" AS s,
      10 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.k AS k,
  Rate.r AS v
FROM
  t_1_V AS t_0_V, t_2_Rate AS Rate
WHERE
  (t_0_V.s = Rate.s) ORDER BY k NULLS LAST;