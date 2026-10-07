SELECT
  x_1 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[2, 1], synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY x;