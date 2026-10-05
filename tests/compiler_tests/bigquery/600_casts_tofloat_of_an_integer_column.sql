SELECT
  x_3 AS x,
  ((CAST(x_3 AS FLOAT64)) / (2)) AS h
FROM
  UNNEST(ARRAY[1, 3]) as x_3 ORDER BY x;