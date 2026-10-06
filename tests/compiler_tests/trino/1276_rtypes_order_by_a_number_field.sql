SELECT
  x_1 AS n
FROM
  UNNEST(TRANSFORM(ARRAY[100, 9, 10], synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY n;