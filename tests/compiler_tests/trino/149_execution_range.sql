SELECT
  x_1 AS x
FROM
  UNNEST(FILTER(SEQUENCE(0, 3), x -> x < 3)) as pushkin(x_1) ORDER BY x;