SELECT
  SUM(1) AS n
FROM
  UNNEST(ARRAY[1, 3]) as pushkin(x_2);