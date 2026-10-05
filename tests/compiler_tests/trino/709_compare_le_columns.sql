SELECT
  x_5 AS a,
  x_7 AS b
FROM
  UNNEST(ARRAY[1, 2]) as pushkin(x_5), UNNEST(ARRAY[1, 2]) as pushkin(x_7)
WHERE
  (x_5 <= x_7) ORDER BY a, b;