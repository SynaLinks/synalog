SELECT
  x_3 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[4, 1, 9, 7], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY x DESC LIMIT 2;