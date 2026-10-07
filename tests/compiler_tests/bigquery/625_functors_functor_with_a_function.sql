SELECT
  ((x_8) * (x_8)) AS y
FROM
  UNNEST(ARRAY[1, 2]) as x_8 ORDER BY y;