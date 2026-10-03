SELECT
  MIN(x_2) AS lo,
  MAX(x_2) AS hi
FROM
  UNNEST(ARRAY[4, 1, 9, 7]) as pushkin(x_2);