SELECT
  x_5 AS n,
  x_3 AS i
FROM
  UNNEST(ARRAY[1, 2]) as pushkin(x_5), UNNEST(FILTER(SEQUENCE(0, x_5), x -> x < x_5)) as pushkin(x_3) ORDER BY n, i;