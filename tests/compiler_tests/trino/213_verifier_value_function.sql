SELECT
  x_7 AS x,
  ((x_7) + (1)) AS y
FROM
  UNNEST(ARRAY[1, 2]) as pushkin(x_7) ORDER BY x;