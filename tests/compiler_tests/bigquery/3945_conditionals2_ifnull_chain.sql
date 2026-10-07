WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      5 AS x,
      "a" AS s
   UNION ALL
  
    SELECT
      2 AS k,
      -3 AS x,
      null AS s
   UNION ALL
  
    SELECT
      3 AS k,
      0 AS x,
      "c" AS s
   UNION ALL
  
    SELECT
      4 AS k,
      null AS x,
      "d" AS s
   UNION ALL
  
    SELECT
      5 AS k,
      12 AS x,
      null AS s
   UNION ALL
  
    SELECT
      6 AS k,
      7 AS x,
      "f" AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.k AS k,
  COALESCE(t_0_V.s, COALESCE((SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INT64) AS STRING) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS STRING) WHEN ABS(synalog_v) < 1 THEN CAST(ROUND(CAST(CAST(synalog_v AS STRING) AS BIGNUMERIC), 15) AS STRING) ELSE CAST(ROUND(CAST(CAST(synalog_v AS STRING) AS BIGNUMERIC), 15 - LENGTH(CAST(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS STRING) AS BIGNUMERIC))) AS BIGNUMERIC) AS STRING))) AS STRING) END) FROM UNNEST([t_0_V.x]) AS synalog_v), "-")) AS v
FROM
  t_1_V AS t_0_V ORDER BY k NULLS LAST;