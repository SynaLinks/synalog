SELECT
  SUM(1) AS n
FROM
  UNNEST(ARRAY[1, 1, 2]) as pushkin(x_2) ORDER BY n;