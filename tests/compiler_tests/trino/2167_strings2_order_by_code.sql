SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY['b', 'B', 'a', 'A', '_', '1', 'é', 'ab', 'aB']) as pushkin(x_1) ORDER BY s;