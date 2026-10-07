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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.k AS k,
  CASE WHEN (CASE WHEN (t_0_V.x > 0) THEN 1 WHEN (t_0_V.x < 0) THEN -1 ELSE 0 END IS null) THEN "none" ELSE (SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INT64) AS STRING) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS STRING) WHEN ABS(synalog_v) < 1 THEN CAST(ROUND(CAST(CAST(synalog_v AS STRING) AS BIGNUMERIC), 15) AS STRING) ELSE CAST(ROUND(CAST(CAST(synalog_v AS STRING) AS BIGNUMERIC), 15 - LENGTH(CAST(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS STRING) AS BIGNUMERIC))) AS BIGNUMERIC) AS STRING))) AS STRING) END) FROM UNNEST([CASE WHEN (t_0_V.x > 0) THEN 1 WHEN (t_0_V.x < 0) THEN -1 ELSE 0 END]) AS synalog_v) END AS v
FROM
  t_1_V AS t_0_V ORDER BY k NULLS LAST;