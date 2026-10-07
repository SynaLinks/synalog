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
  t_0_X.k AS k,
  ROUND(t_0_X.x) AS v
FROM
  t_1_X AS t_0_X ORDER BY k NULLS LAST;