WITH t_2_O AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS c,
      30 AS amt
   UNION ALL
  
    SELECT
      2 AS id,
      'ann' AS c,
      12 AS amt
   UNION ALL
  
    SELECT
      3 AS id,
      'bob' AS c,
      50 AS amt
   UNION ALL
  
    SELECT
      4 AS id,
      'cid' AS c,
      7 AS amt
   UNION ALL
  
    SELECT
      5 AS id,
      'cid' AS c,
      7 AS amt
   UNION ALL
  
    SELECT
      6 AS id,
      'cid' AS c,
      40 AS amt
   UNION ALL
  
    SELECT
      7 AS id,
      'bob' AS c,
      5 AS amt
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ARRAY_JOIN((SELECT
  ARRAY_AGG(element_at(transform(ARRAY[O.amt], synalog_v -> (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS BIGINT) AS VARCHAR) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS VARCHAR) WHEN ABS(synalog_v) < 1 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(CAST(ROUND(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,35)), 15) AS DECIMAL(38,35)) AS VARCHAR))) WHEN ABS(synalog_v) < 1e18 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(CAST(ROUND(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,20)), CAST(15 - LENGTH(CAST(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,20)))) AS BIGINT) AS VARCHAR)) AS INTEGER)) AS DECIMAL(38,20)) AS VARCHAR))) ELSE CAST(CAST(ROUND(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,0)), CAST(15 - LENGTH(CAST(ABS(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,0))) AS VARCHAR)) AS INTEGER)) AS DECIMAL(38,0)) AS VARCHAR) END)), 1) order by O.id) AS logica_value
FROM
  t_2_O AS O
WHERE
  (O.c = 'cid')), ';') AS s;