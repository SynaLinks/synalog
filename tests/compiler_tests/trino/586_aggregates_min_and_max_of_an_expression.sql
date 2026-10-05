SELECT
  MIN(x_2) AS lo,
  MAX(- ((x_2) * (-1))) AS hi
FROM
  UNNEST(ARRAY[-3, 1, 3]) as pushkin(x_2);