WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      7 AS x
   UNION ALL
  
    SELECT
      2 AS id,
      -7 AS x
   UNION ALL
  
    SELECT
      3 AS id,
      2.5 AS x
   UNION ALL
  
    SELECT
      4 AS id,
      -2.5 AS x
   UNION ALL
  
    SELECT
      5 AS id,
      0 AS x
   UNION ALL
  
    SELECT
      6 AS id,
      3 AS x
   UNION ALL
  
    SELECT
      7 AS id,
      0.125 AS x
   UNION ALL
  
    SELECT
      8 AS id,
      1000000 AS x
   UNION ALL
  
    SELECT
      9 AS id,
      -0.75 AS x
   UNION ALL
  
    SELECT
      10 AS id,
      12.345 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.id AS id,
  (SELECT (CASE WHEN synalog_v IS NULL OR 2 IS NULL THEN NULL WHEN CAST(synalog_v AS FLOAT64) = 0 THEN CAST(synalog_v AS FLOAT64) WHEN FLOOR(LOG10(ABS(CAST(synalog_v AS FLOAT64)))) - 14 + 2 >= 0 THEN (CASE WHEN CAST(synalog_v AS FLOAT64) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS FLOAT64)) / POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS FLOAT64)))) - 14) + 0.5) * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS FLOAT64)))) - 14) + 0 ELSE (CASE WHEN CAST(synalog_v AS FLOAT64) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS FLOAT64)) * POWER(10, 2) + 0.5 + 0.5 * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS FLOAT64)))) - 14 + 2)) / POWER(10, 2) + 0 END) FROM UNNEST([t_0_V.x]) AS synalog_v) AS v
FROM
  t_1_V AS t_0_V ORDER BY id NULLS LAST;