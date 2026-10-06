SELECT
  x_1 AS x,
  - x_1 AS y
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY y;