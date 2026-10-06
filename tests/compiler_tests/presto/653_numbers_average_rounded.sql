WITH t_1_A AS (SELECT
  AVG(x_3) AS a
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 4], synalog_e -> ROW(synalog_e))) as pushkin(x_3))
SELECT
  element_at(transform(ARRAY[t_0_A.a], synalog_v -> (CASE WHEN synalog_v IS NULL OR 2 IS NULL THEN NULL WHEN CAST(synalog_v AS DOUBLE) = 0 THEN CAST(synalog_v AS DOUBLE) WHEN FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14 + 2 >= 0 THEN (CASE WHEN CAST(synalog_v AS DOUBLE) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS DOUBLE)) / POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14) + 0.5) * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14) + 0 ELSE (CASE WHEN CAST(synalog_v AS DOUBLE) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS DOUBLE)) * POWER(10, 2) + 0.5 + 0.5 * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14 + 2)) / POWER(10, 2) + 0 END)), 1) AS r
FROM
  t_1_A AS t_0_A;