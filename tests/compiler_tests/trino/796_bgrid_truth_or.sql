SELECT
  x_5 AS x,
  x_7 AS y
FROM
  UNNEST(TRANSFORM(ARRAY[0, 1], synalog_e -> ROW(synalog_e))) as pushkin(x_5), UNNEST(TRANSFORM(ARRAY[0, 1], synalog_e -> ROW(synalog_e))) as pushkin(x_7)
WHERE
  ((x_5 = 1) OR (x_7 = 1)) ORDER BY x, y;