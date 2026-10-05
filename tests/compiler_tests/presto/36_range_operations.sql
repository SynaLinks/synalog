SELECT
  x_7 AS x,
  ((x_7) * (x_7)) AS squared
FROM
  UNNEST(FILTER(SEQUENCE(0, 5), x -> x < 5)) as pushkin(x_7)
WHERE
  (x_7 > 1) ORDER BY x;