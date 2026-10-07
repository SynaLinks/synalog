SELECT
  x_7 AS x,
  ABS(x_7) AS y,
  100 AS z
FROM
  UNNEST(TRANSFORM(ARRAY[2, -3], synalog_e -> ROW(synalog_e))) as pushkin(x_11), UNNEST(TRANSFORM(ARRAY[2, -3], synalog_e -> ROW(synalog_e))) as pushkin(x_7)
WHERE
  (x_7 = x_11) ORDER BY x;