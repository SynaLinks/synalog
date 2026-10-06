WITH t_0_C AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'AB-001' AS code,
      'north' AS zone,
      12.5E0 AS x
   UNION ALL
  
    SELECT
      2 AS id,
      'AB-017' AS code,
      'south' AS zone,
      -3.75E0 AS x
   UNION ALL
  
    SELECT
      3 AS id,
      'XY-200' AS code,
      'north' AS zone,
      0.0E0 AS x
   UNION ALL
  
    SELECT
      4 AS id,
      'XY-031' AS code,
      'east' AS zone,
      7.0E0 AS x
   UNION ALL
  
    SELECT
      5 AS id,
      'QZ-999' AS code,
      'south' AS zone,
      -12.25E0 AS x
   UNION ALL
  
    SELECT
      6 AS id,
      'AB-120' AS code,
      'east' AS zone,
      99.9E0 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  C.id AS id,
  LPAD(element_at(transform(ARRAY[C.id], synalog_v -> (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS BIGINT) AS VARCHAR) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS VARCHAR) WHEN ABS(synalog_v) >= 1e15 THEN CAST(ROUND(CAST(synalog_v AS DECIMAL(38,0)), 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INTEGER)) AS VARCHAR) ELSE rtrim(rtrim(CAST(CAST(ROUND(synalog_v, 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INTEGER)) AS DECIMAL(38,15)) AS VARCHAR), '0'), '.') END)), 1), 4, '0') AS s
FROM
  t_0_C AS C ORDER BY id, s;