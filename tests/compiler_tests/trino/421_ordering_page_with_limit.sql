SELECT
  x_1 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[40, 10, 30, 20], synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY x LIMIT 2;