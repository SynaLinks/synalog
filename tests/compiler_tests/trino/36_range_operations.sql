SELECT
  x_7 AS x,
  ((x_7) * (x_7)) AS squared
FROM
  UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 5), x -> x < 5), synalog_e -> ROW(synalog_e))) as pushkin(x_7)
WHERE
  (x_7 > 1) ORDER BY x;