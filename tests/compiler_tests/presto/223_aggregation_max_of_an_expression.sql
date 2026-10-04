SELECT
  MAX(((x_2) * (x_2))) AS m
FROM
  UNNEST(ARRAY[1, -3, 2]) as pushkin(x_2);