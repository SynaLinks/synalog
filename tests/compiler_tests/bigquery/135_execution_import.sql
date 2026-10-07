SELECT
  ((2) * (x_2)) AS y
FROM
  UNNEST(ARRAY[1, 2]) as x_2 ORDER BY y;