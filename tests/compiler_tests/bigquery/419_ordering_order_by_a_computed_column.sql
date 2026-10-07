SELECT
  x_1 AS x,
  - x_1 AS y
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_1 ORDER BY y;