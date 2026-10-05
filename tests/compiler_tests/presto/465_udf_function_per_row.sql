SELECT
  x_7 AS x,
  ((((2) * (x_7))) + (1)) AS y
FROM
  UNNEST(ARRAY[1, 2, 3]) as pushkin(x_7) ORDER BY x;