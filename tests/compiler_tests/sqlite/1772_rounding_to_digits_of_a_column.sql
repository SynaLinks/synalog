WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      1 AS x
   UNION ALL
  
    SELECT
      'b' AS k,
      2 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_T AS (SELECT
  SUM(t_3_V.x) AS t
FROM
  t_1_V AS t_3_V)
SELECT
  V.k AS k,
  (SELECT (CASE WHEN synalog_v IS NULL OR 2 IS NULL THEN NULL WHEN CAST(synalog_v AS REAL) = 0 THEN CAST(synalog_v AS REAL) WHEN FLOOR(LOG10(ABS(CAST(synalog_v AS REAL)))) - 14 + 2 >= 0 THEN (CASE WHEN CAST(synalog_v AS REAL) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS REAL)) / POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS REAL)))) - 14) + 0.5) * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS REAL)))) - 14) + 0 ELSE (CASE WHEN CAST(synalog_v AS REAL) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS REAL)) * POWER(10, 2) + 0.5 + 0.5 * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS REAL)))) - 14 + 2)) / POWER(10, 2) + 0 END) FROM (SELECT ((100) * ((CAST(V.x AS REAL) / NULLIF(t_0_T.t, 0)))) AS synalog_v)) AS pct
FROM
  t_1_V AS V, t_2_T AS t_0_T ORDER BY k NULLS LAST;