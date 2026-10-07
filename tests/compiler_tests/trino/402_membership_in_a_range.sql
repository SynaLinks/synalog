SELECT
  x_1 AS x
FROM
  UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 3), x -> x < 3), synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY x;