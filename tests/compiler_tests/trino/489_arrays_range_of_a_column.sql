SELECT
  x_5 AS n,
  x_3 AS i
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_5), UNNEST(TRANSFORM(FILTER(SEQUENCE(0, x_5), x -> x < x_5), synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY n, i;