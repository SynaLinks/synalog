SELECT
  SUM(1) AS c
FROM
  UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 6), x -> x < 6), synalog_e -> ROW(synalog_e))) as pushkin(x_0), UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 6), x -> x < 6), synalog_e -> ROW(synalog_e))) as pushkin(x_1)
WHERE
  (x_0 < x_1);