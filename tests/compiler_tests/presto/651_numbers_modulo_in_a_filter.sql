SELECT
  x_1 AS x
FROM
  UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 10), x -> x < 10), synalog_e -> ROW(synalog_e))) as pushkin(x_1)
WHERE
  (x_1 > 0) AND
  ((MOD(x_1, NULLIF(3, 0))) = 0) ORDER BY x;