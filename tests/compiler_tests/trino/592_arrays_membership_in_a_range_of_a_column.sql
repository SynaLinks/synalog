SELECT
  2 AS n,
  x_3 AS i
FROM
  UNNEST(FILTER(SEQUENCE(0, 2), x -> x < 2)) as pushkin(x_3) ORDER BY i;