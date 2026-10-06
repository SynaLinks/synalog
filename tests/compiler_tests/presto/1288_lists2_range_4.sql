SELECT
  x_1 AS x
FROM
  UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 4), x -> x < 4), synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY x;