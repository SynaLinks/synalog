SELECT
  x_1 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY x LIMIT 0;