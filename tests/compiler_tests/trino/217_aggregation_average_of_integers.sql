SELECT
  AVG(x_2) AS m
FROM
  UNNEST(ARRAY[1, 2, 3, 4]) as pushkin(x_2);