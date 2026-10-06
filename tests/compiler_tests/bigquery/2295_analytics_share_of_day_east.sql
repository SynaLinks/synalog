WITH t_1_S AS (SELECT * FROM (
  
    SELECT
      "north" AS r,
      1 AS d,
      5 AS v
   UNION ALL
  
    SELECT
      "north" AS r,
      2 AS d,
      8 AS v
   UNION ALL
  
    SELECT
      "north" AS r,
      3 AS d,
      3 AS v
   UNION ALL
  
    SELECT
      "north" AS r,
      5 AS d,
      9 AS v
   UNION ALL
  
    SELECT
      "north" AS r,
      6 AS d,
      1 AS v
   UNION ALL
  
    SELECT
      "south" AS r,
      1 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      "south" AS r,
      2 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      "south" AS r,
      4 AS d,
      2 AS v
   UNION ALL
  
    SELECT
      "south" AS r,
      5 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      "east" AS r,
      2 AS d,
      4 AS v
   UNION ALL
  
    SELECT
      "east" AS r,
      3 AS d,
      11 AS v
   UNION ALL
  
    SELECT
      "east" AS r,
      4 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      "east" AS r,
      5 AS d,
      10 AS v
   UNION ALL
  
    SELECT
      "east" AS r,
      7 AS d,
      3 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_2_T AS (SELECT
  SUM(t_3_S.v) AS t
FROM
  t_1_S AS t_3_S
WHERE
  (t_3_S.r = "east"))
SELECT
  S.d AS d,
  (SELECT (CASE WHEN synalog_v IS NULL OR 6 IS NULL THEN NULL WHEN CAST(synalog_v AS FLOAT64) = 0 THEN CAST(synalog_v AS FLOAT64) WHEN FLOOR(LOG10(ABS(CAST(synalog_v AS FLOAT64)))) - 14 + 6 >= 0 THEN (CASE WHEN CAST(synalog_v AS FLOAT64) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS FLOAT64)) / POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS FLOAT64)))) - 14) + 0.5) * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS FLOAT64)))) - 14) + 0 ELSE (CASE WHEN CAST(synalog_v AS FLOAT64) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS FLOAT64)) * POWER(10, 6) + 0.5 + 0.5 * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS FLOAT64)))) - 14 + 6)) / POWER(10, 6) + 0 END) FROM UNNEST([((100) * (((S.v) / NULLIF(t_0_T.t, 0))))]) AS synalog_v) AS pct
FROM
  t_1_S AS S, t_2_T AS t_0_T
WHERE
  (S.r = "east") ORDER BY d NULLS LAST, pct NULLS LAST;