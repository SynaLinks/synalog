SELECT
  x_3 AS x,
  (x_3 > 3) AS big
FROM
  UNNEST(ARRAY[5, 1]) as x_3 ORDER BY big;