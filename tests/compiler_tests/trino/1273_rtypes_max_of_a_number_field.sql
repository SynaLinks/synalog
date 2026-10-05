SELECT
  MAX(x_1) AS m
FROM
  UNNEST(ARRAY[100, 9, 10]) as pushkin(x_1);