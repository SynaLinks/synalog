SELECT
  x_3 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3, 4, 5], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY x DESC LIMIT 3;