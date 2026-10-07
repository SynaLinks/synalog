SELECT
  x_3 AS x,
  (x_3 > 2) AS big
FROM
  UNNEST(ARRAY[1, 3]) as x_3 ORDER BY x;