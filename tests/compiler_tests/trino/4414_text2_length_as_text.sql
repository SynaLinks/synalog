WITH t_0_W AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'Hello' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      ' a ' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      '' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      'aaa' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      null AS s
   UNION ALL
  
    SELECT
      6 AS k,
      'hello world' AS s
   UNION ALL
  
    SELECT
      7 AS k,
      'naïve' AS s
   UNION ALL
  
    SELECT
      8 AS k,
      'lol' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  W.k AS k,
  element_at(transform(ARRAY[LENGTH(W.s)], synalog_v -> (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS BIGINT) AS VARCHAR) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS VARCHAR) WHEN ABS(synalog_v) < 1 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(CAST(ROUND(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,35)), 15) AS DECIMAL(38,35)) AS VARCHAR))) WHEN ABS(synalog_v) < 1e18 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(CAST(ROUND(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,20)), CAST(15 - LENGTH(CAST(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,20)))) AS BIGINT) AS VARCHAR)) AS INTEGER)) AS DECIMAL(38,20)) AS VARCHAR))) ELSE CAST(CAST(ROUND(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,0)), CAST(15 - LENGTH(CAST(ABS(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,0))) AS VARCHAR)) AS INTEGER)) AS DECIMAL(38,0)) AS VARCHAR) END)), 1) AS v
FROM
  t_0_W AS W ORDER BY k;