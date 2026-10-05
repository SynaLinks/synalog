SELECT
  x_1 AS n
FROM
  UNNEST(ARRAY[100, 9, 10]) as pushkin(x_1)
WHERE
  (x_1 > 9) ORDER BY n;