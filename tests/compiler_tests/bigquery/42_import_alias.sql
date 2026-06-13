SELECT
  x_15 AS x,
  ((x_15) * (2)) AS doubled,
  ((x_15) * (x_15)) AS squared
FROM
  UNNEST(ARRAY[5, 6, 7]) as x_15 ORDER BY x;