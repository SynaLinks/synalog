WITH t_1_X AS (SELECT * FROM VALUES
  (1, 17),
  (2, -17),
  (3, 4),
  (4, 0),
  (5, null),
  (6, 3000000000),
  (7, -1),
  (8, 9)
AS UNUSED_TABLE_NAME(k, x))
SELECT
  t_0_X.k AS k,
  transform(array(t_0_X.x), synalog_v -> (CASE WHEN synalog_v IS NULL OR 1 IS NULL THEN NULL WHEN CAST(synalog_v AS DOUBLE) = 0 THEN CAST(synalog_v AS DOUBLE) WHEN FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14 + 1 >= 0 THEN (CASE WHEN CAST(synalog_v AS DOUBLE) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS DOUBLE)) / POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14) + 0.5) * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14) + 0 ELSE (CASE WHEN CAST(synalog_v AS DOUBLE) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS DOUBLE)) * POWER(10, 1) + 0.5 + 0.5 * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14 + 1)) / POWER(10, 1) + 0 END))[0] AS v
FROM
  t_1_X AS t_0_X ORDER BY k NULLS LAST;