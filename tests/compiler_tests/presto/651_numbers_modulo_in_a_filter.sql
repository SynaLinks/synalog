SELECT
  x_1 AS x
FROM
  UNNEST(FILTER(SEQUENCE(0, 10), x -> x < 10)) as pushkin(x_1)
WHERE
  (x_1 > 0) AND
  ((MOD(x_1, 3)) = 0) ORDER BY x;