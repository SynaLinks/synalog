SELECT
  MIN(x_2) AS m
FROM
  UNNEST(ARRAY[-1.5, -2.5, 0.5]) as x_2;