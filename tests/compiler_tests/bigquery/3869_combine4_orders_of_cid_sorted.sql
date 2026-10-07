WITH t_2_O AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "ann" AS c,
      30 AS amt
   UNION ALL
  
    SELECT
      2 AS id,
      "ann" AS c,
      12 AS amt
   UNION ALL
  
    SELECT
      3 AS id,
      "bob" AS c,
      50 AS amt
   UNION ALL
  
    SELECT
      4 AS id,
      "cid" AS c,
      7 AS amt
   UNION ALL
  
    SELECT
      5 AS id,
      "cid" AS c,
      7 AS amt
   UNION ALL
  
    SELECT
      6 AS id,
      "cid" AS c,
      40 AS amt
   UNION ALL
  
    SELECT
      7 AS id,
      "bob" AS c,
      5 AS amt
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ARRAY_TO_STRING((SELECT
  ARRAY_AGG((SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INT64) AS STRING) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS STRING) WHEN ABS(synalog_v) < 1 THEN CAST(ROUND(CAST(CAST(synalog_v AS STRING) AS BIGNUMERIC), 15) AS STRING) ELSE CAST(ROUND(CAST(CAST(synalog_v AS STRING) AS BIGNUMERIC), 15 - LENGTH(CAST(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS STRING) AS BIGNUMERIC))) AS BIGNUMERIC) AS STRING))) AS STRING) END) FROM UNNEST([O.amt]) AS synalog_v) order by [O.id][offset(0)]) AS logica_value
FROM
  t_2_O AS O
WHERE
  (O.c = "cid")), ";") AS s;