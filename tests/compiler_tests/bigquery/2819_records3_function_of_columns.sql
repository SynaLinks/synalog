WITH t_1_B AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "Dune" AS title,
      "herbert" AS author,
      1965 AS year,
      412 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      2 AS id,
      "Emma" AS title,
      "austen" AS author,
      1815 AS year,
      474 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      3 AS id,
      "Ubik" AS title,
      "dick" AS author,
      1969 AS year,
      202 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      4 AS id,
      "Kim" AS title,
      "kipling" AS author,
      1901 AS year,
      368 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      5 AS id,
      "Solaris" AS title,
      "lem" AS author,
      1961 AS year,
      204 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      6 AS id,
      "Persuasion" AS title,
      "austen" AS author,
      1817 AS year,
      249 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      7 AS id,
      "Valis" AS title,
      "dick" AS author,
      1981 AS year,
      271 AS pages,
      true AS sf
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B.title AS title,
  (((B.title || " (") || (SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INT64) AS STRING) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS STRING) WHEN ABS(synalog_v) < 1 THEN CAST(ROUND(CAST(CAST(synalog_v AS STRING) AS BIGNUMERIC), 15) AS STRING) ELSE CAST(ROUND(CAST(CAST(synalog_v AS STRING) AS BIGNUMERIC), 15 - LENGTH(CAST(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS STRING) AS BIGNUMERIC))) AS BIGNUMERIC) AS STRING))) AS STRING) END) FROM UNNEST([B.year]) AS synalog_v)) || ")") AS label
FROM
  t_1_B AS B ORDER BY title NULLS LAST, label NULLS LAST;