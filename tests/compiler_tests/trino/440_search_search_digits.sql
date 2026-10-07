SELECT
  x_1 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[15, 21, 25], synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY x;