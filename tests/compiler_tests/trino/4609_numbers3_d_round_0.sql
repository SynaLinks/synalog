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
      2.5E0 AS x
   UNION ALL
  
    SELECT
      4 AS k,
      -2.5E0 AS x
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
      0.1E0 AS x
   UNION ALL
  
    SELECT
      8 AS k,
      -0.75E0 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_X.k AS k,
  element_at(transform(ARRAY[t_0_X.x], synalog_v -> (CASE WHEN synalog_v IS NULL OR 0 IS NULL THEN NULL WHEN CAST(synalog_v AS DOUBLE) = 0 THEN CAST(synalog_v AS DOUBLE) WHEN FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14 + 0 >= 0 THEN (CASE WHEN CAST(synalog_v AS DOUBLE) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS DOUBLE)) / POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14) + 0.5) * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14) + 0 ELSE (CASE WHEN CAST(synalog_v AS DOUBLE) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS DOUBLE)) * POWER(10, 0) + 0.5 + 0.5 * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14 + 0)) / POWER(10, 0) + 0 END)), 1) AS v
FROM
  t_1_X AS t_0_X ORDER BY k;