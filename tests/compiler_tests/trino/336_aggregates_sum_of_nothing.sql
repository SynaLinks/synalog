SELECT
  SUM(x_2) AS t
FROM
  UNNEST(ARRAY[1]) as pushkin(x_2)
WHERE
  (x_2 > 5);