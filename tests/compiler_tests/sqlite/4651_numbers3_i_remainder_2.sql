WITH t_1_X AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      17 AS x
   UNION ALL
  
    SELECT
      2 AS k,
      -17 AS x
   UNION ALL
  
    SELECT
      3 AS k,
      4 AS x
   UNION ALL
  
    SELECT
      4 AS k,
      0 AS x
   UNION ALL
  
    SELECT
      5 AS k,
      null AS x
   UNION ALL
  
    SELECT
      6 AS k,
      3000000000 AS x
   UNION ALL
  
    SELECT
      7 AS k,
      -1 AS x
   UNION ALL
  
    SELECT
      8 AS k,
      9 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_X.k AS k,
  (((t_0_X.x) - (2) * CAST((t_0_X.x) / NULLIF(2, 0) AS INTEGER))) AS v
FROM
  t_1_X AS t_0_X ORDER BY k NULLS LAST;