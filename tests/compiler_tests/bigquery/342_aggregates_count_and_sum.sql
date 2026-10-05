SELECT
  SUM(1) AS n,
  SUM(x_2) AS t,
  MIN(x_2) AS lo,
  MAX(x_2) AS hi,
  AVG(x_2) AS a
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_2;