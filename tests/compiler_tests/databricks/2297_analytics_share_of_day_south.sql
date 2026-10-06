WITH t_1_S AS (SELECT * FROM VALUES
  ("north", 1, 5),
  ("north", 2, 8),
  ("north", 3, 3),
  ("north", 5, 9),
  ("north", 6, 1),
  ("south", 1, 7),
  ("south", 2, 7),
  ("south", 4, 2),
  ("south", 5, 6),
  ("east", 2, 4),
  ("east", 3, 11),
  ("east", 4, 6),
  ("east", 5, 10),
  ("east", 7, 3)
AS UNUSED_TABLE_NAME(r, d, v)),
t_2_T AS (SELECT
  SUM(t_3_S.v) AS t
FROM
  t_1_S AS t_3_S
WHERE
  (t_3_S.r = "south"))
SELECT
  S.d AS d,
  transform(array(((100) * (((S.v) / NULLIF(t_0_T.t, 0))))), synalog_v -> (CASE WHEN synalog_v IS NULL OR 6 IS NULL THEN NULL WHEN CAST(synalog_v AS DOUBLE) = 0 THEN CAST(synalog_v AS DOUBLE) WHEN FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14 + 6 >= 0 THEN (CASE WHEN CAST(synalog_v AS DOUBLE) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS DOUBLE)) / POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14) + 0.5) * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14) + 0 ELSE (CASE WHEN CAST(synalog_v AS DOUBLE) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS DOUBLE)) * POWER(10, 6) + 0.5 + 0.5 * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14 + 6)) / POWER(10, 6) + 0 END))[0] AS pct
FROM
  t_1_S AS S, t_2_T AS t_0_T
WHERE
  (S.r = "south") ORDER BY d NULLS LAST, pct NULLS LAST;