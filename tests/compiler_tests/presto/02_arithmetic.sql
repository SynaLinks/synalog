SELECT
  x_15 AS x,
  ((x_15) + (5)) AS plus,
  ((x_15) - (3)) AS sub,
  ((x_15) * (2)) AS mul
FROM
  UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 10), x -> x < 10), synalog_e -> ROW(synalog_e))) as pushkin(x_15)
WHERE
  (x_15 > 0) ORDER BY x;