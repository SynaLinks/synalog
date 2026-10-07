SELECT
  SUM(x_0) AS s
FROM
  UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 5), x -> x < 5), synalog_e -> ROW(synalog_e))) as pushkin(x_0);