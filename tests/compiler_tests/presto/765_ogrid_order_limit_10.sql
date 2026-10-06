SELECT
  x_1 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[5, 3, 9, 1, 7], synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY x LIMIT 10;