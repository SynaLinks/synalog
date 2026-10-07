SELECT
  SUM(x_0) AS s
FROM
  UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 3), x -> x < 3), synalog_e -> ROW(synalog_e))) as pushkin(x_0);