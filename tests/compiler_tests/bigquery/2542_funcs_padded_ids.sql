WITH t_0_C AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "AB-001" AS code,
      "north" AS zone,
      12.5 AS x
   UNION ALL
  
    SELECT
      2 AS id,
      "AB-017" AS code,
      "south" AS zone,
      -3.75 AS x
   UNION ALL
  
    SELECT
      3 AS id,
      "XY-200" AS code,
      "north" AS zone,
      0.0 AS x
   UNION ALL
  
    SELECT
      4 AS id,
      "XY-031" AS code,
      "east" AS zone,
      7.0 AS x
   UNION ALL
  
    SELECT
      5 AS id,
      "QZ-999" AS code,
      "south" AS zone,
      -12.25 AS x
   UNION ALL
  
    SELECT
      6 AS id,
      "AB-120" AS code,
      "east" AS zone,
      99.9 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  C.id AS id,
  LPAD((SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INT64) AS STRING) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS STRING) WHEN ABS(synalog_v) < 1 THEN CAST(ROUND(CAST(CAST(synalog_v AS STRING) AS BIGNUMERIC), 15) AS STRING) ELSE CAST(ROUND(CAST(CAST(synalog_v AS STRING) AS BIGNUMERIC), 15 - LENGTH(CAST(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS STRING) AS BIGNUMERIC))) AS BIGNUMERIC) AS STRING))) AS STRING) END) FROM UNNEST([C.id]) AS synalog_v), 4, "0") AS s
FROM
  t_0_C AS C ORDER BY id NULLS LAST, s NULLS LAST;