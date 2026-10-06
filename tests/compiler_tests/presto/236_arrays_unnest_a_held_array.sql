SELECT
  x_2 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[3, 1], synalog_e -> ROW(synalog_e))) as pushkin(x_2) ORDER BY x;