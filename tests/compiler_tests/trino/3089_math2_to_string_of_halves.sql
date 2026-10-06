WITH t_0_V AS (SELECT * FROM (
  
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
      2.5E0 AS x
   UNION ALL
  
    SELECT
      4 AS id,
      -2.5E0 AS x
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
      0.125E0 AS x
   UNION ALL
  
    SELECT
      8 AS id,
      1000000 AS x
   UNION ALL
  
    SELECT
      9 AS id,
      -0.75E0 AS x
   UNION ALL
  
    SELECT
      10 AS id,
      12.345E0 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.id AS id,
  element_at(transform(ARRAY[(CAST(V.x AS DOUBLE) / NULLIF(2, 0))], synalog_v -> (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS BIGINT) AS VARCHAR) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS VARCHAR) WHEN ABS(synalog_v) >= 1e15 THEN CAST(ROUND(CAST(synalog_v AS DECIMAL(38,0)), 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INTEGER)) AS VARCHAR) ELSE TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(CAST(ROUND(synalog_v, 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INTEGER)) AS DECIMAL(38,15)) AS VARCHAR))) END)), 1) AS s
FROM
  t_0_V AS V ORDER BY id;