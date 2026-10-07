SELECT
  2 AS n,
  x_3 AS i
FROM
  UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 2), x -> x < 2), synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY i;