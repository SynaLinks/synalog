SELECT
  x_3 AS x,
  (POW(x_3, 2)) AS p
FROM
  UNNEST(ARRAY[2, 3]) as x_3 ORDER BY x;