WITH t_0_V AS (SELECT * FROM (
  
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
  CASE WHEN ((MOD(V.x, NULLIF(2, 0))) IS null) THEN "none" ELSE (SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INT64) AS STRING) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS STRING) WHEN ABS(synalog_v) >= 1e15 THEN CAST(ROUND(CAST(synalog_v AS BIGNUMERIC), 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INT64)) AS STRING) ELSE CAST(ROUND(CAST(synalog_v AS BIGNUMERIC), 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INT64)) AS STRING) END) FROM UNNEST([(MOD(V.x, NULLIF(2, 0)))]) AS synalog_v) END AS g,
  SUM(1) AS n
FROM
  t_0_V AS V
GROUP BY g ORDER BY g NULLS LAST;