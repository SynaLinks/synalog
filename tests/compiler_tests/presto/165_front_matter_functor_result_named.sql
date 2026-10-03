SELECT
  SUM(1) AS n
FROM
  UNNEST(ARRAY[3]) as pushkin(x_2) ORDER BY n;