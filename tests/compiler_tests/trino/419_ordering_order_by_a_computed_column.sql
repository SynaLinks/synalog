SELECT
  x_1 AS x,
  - x_1 AS y
FROM
  UNNEST(ARRAY[1, 2, 3]) as pushkin(x_1) ORDER BY y;