WITH t_0_Customer AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "Ada" AS first,
      "Lovelace" AS last,
      "ada@analytical.org" AS email
   UNION ALL
  
    SELECT
      2 AS id,
      "alan" AS first,
      "TURING" AS last,
      "alan@bletchley.uk" AS email
   UNION ALL
  
    SELECT
      3 AS id,
      "Grace" AS first,
      "Hopper" AS last,
      "grace@navy.mil" AS email
   UNION ALL
  
    SELECT
      4 AS id,
      "Edsger" AS first,
      "Dijkstra" AS last,
      "ewd@utexas.edu" AS email
   UNION ALL
  
    SELECT
      5 AS id,
      "Barbara" AS first,
      "Liskov" AS last,
      "liskov@mit.edu" AS email
   UNION ALL
  
    SELECT
      6 AS id,
      "Ken" AS first,
      "Thompson" AS last,
      "ken@bell-labs.com" AS email
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Customer.id AS id,
  ((("#" || (SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INT64) AS STRING) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS STRING) WHEN ABS(synalog_v) >= 1e15 THEN CAST(ROUND(CAST(synalog_v AS BIGNUMERIC), 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INT64)) AS STRING) ELSE CAST(ROUND(CAST(synalog_v AS BIGNUMERIC), 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INT64)) AS STRING) END) FROM UNNEST([Customer.id]) AS synalog_v)) || ": ") || Customer.last) AS label
FROM
  t_0_Customer AS Customer ORDER BY id NULLS LAST, label NULLS LAST;
