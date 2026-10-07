WITH t_1_L AS (SELECT
  ARRAY_AGG(x_8) AS l
FROM
  UNNEST(TRANSFORM(ARRAY[1, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_8))
SELECT
  x_3 AS x
FROM
  t_1_L AS t_0_L, UNNEST(TRANSFORM(t_0_L.l, synalog_e -> ROW(synalog_e))) as pushkin(x_3), UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_5)
WHERE
  (x_5 = x_3) ORDER BY x;