SELECT
  x_1 AS x
FROM
  UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 1), x -> x < 1), synalog_e -> ROW(synalog_e))) as pushkin(x_1);