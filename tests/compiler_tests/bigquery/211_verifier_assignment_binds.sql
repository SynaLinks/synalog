SELECT
  x_2 AS x,
  ((x_2) * (2)) AS y
FROM
  UNNEST(ARRAY[1, 2]) as x_2 ORDER BY x;