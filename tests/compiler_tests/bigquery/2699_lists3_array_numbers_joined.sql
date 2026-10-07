WITH t_3_I AS (SELECT * FROM (
  
    SELECT
      1 AS `order`,
      "ann" AS customer,
      "pen" AS item,
      2.5 AS price,
      3 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      1 AS `order`,
      "ann" AS customer,
      "ink" AS item,
      7.0 AS price,
      1 AS qty,
      2 AS pos
   UNION ALL
  
    SELECT
      2 AS `order`,
      "ann" AS customer,
      "pad" AS item,
      4.0 AS price,
      2 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      3 AS `order`,
      "bob" AS customer,
      "pen" AS item,
      2.5 AS price,
      10 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      3 AS `order`,
      "bob" AS customer,
      "cap" AS item,
      1.25 AS price,
      4 AS qty,
      2 AS pos
   UNION ALL
  
    SELECT
      3 AS `order`,
      "bob" AS customer,
      "ink" AS item,
      7.0 AS price,
      2 AS qty,
      3 AS pos
   UNION ALL
  
    SELECT
      4 AS `order`,
      "cid" AS customer,
      "pad" AS item,
      4.0 AS price,
      1 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      5 AS `order`,
      "cid" AS customer,
      "pen" AS item,
      2.5 AS price,
      1 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      5 AS `order`,
      "cid" AS customer,
      "pen" AS item,
      2.5 AS price,
      2 AS qty,
      2 AS pos
  
) AS UNUSED_TABLE_NAME  ),
t_0_A AS (SELECT
  I.`order` AS `order`,
  ARRAY_AGG((SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INT64) AS STRING) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS STRING) WHEN ABS(synalog_v) < 1 THEN CAST(ROUND(CAST(CAST(synalog_v AS STRING) AS BIGNUMERIC), 15) AS STRING) ELSE CAST(ROUND(CAST(CAST(synalog_v AS STRING) AS BIGNUMERIC), 15 - LENGTH(CAST(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS STRING) AS BIGNUMERIC))) AS BIGNUMERIC) AS STRING))) AS STRING) END) FROM UNNEST([I.qty]) AS synalog_v) order by [I.pos][offset(0)]) AS l
FROM
  t_3_I AS I
GROUP BY `order`)
SELECT
  A.`order` AS `order`,
  ARRAY_TO_STRING(A.l, ";") AS s
FROM
  t_0_A AS A ORDER BY `order` NULLS LAST, s NULLS LAST;