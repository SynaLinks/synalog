WITH t_0_R AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      5 AS x,
      'b' AS s,
      true AS b
   UNION ALL
  
    SELECT
      2 AS k,
      null AS x,
      'a' AS s,
      false AS b
   UNION ALL
  
    SELECT
      3 AS k,
      2 AS x,
      null AS s,
      true AS b
   UNION ALL
  
    SELECT
      4 AS k,
      5 AS x,
      'c' AS s,
      null AS b
   UNION ALL
  
    SELECT
      5 AS k,
      -1 AS x,
      'B' AS s,
      false AS b
   UNION ALL
  
    SELECT
      6 AS k,
      2 AS x,
      'a' AS s,
      true AS b
   UNION ALL
  
    SELECT
      7 AS k,
      null AS x,
      null AS s,
      false AS b
   UNION ALL
  
    SELECT
      8 AS k,
      9 AS x,
      'aa' AS s,
      true AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R.k AS k,
  (CONCAT((CONCAT(R.s, '-')), element_at(transform(ARRAY[R.k], synalog_v -> (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS BIGINT) AS VARCHAR) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS VARCHAR) WHEN ABS(synalog_v) < 1 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(CAST(ROUND(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,35)), 15) AS DECIMAL(38,35)) AS VARCHAR))) WHEN ABS(synalog_v) < 1e18 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(CAST(ROUND(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,20)), CAST(15 - LENGTH(CAST(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,20)))) AS BIGINT) AS VARCHAR)) AS INTEGER)) AS DECIMAL(38,20)) AS VARCHAR))) ELSE CAST(CAST(ROUND(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,0)), CAST(15 - LENGTH(CAST(ABS(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,0))) AS VARCHAR)) AS INTEGER)) AS DECIMAL(38,0)) AS VARCHAR) END)), 1))) AS t
FROM
  t_0_R AS R ORDER BY t desc, k LIMIT 2;