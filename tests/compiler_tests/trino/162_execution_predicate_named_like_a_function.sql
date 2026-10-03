SELECT
  x_7 AS x,
  ABS(x_7) AS y,
  100 AS z
FROM
  UNNEST(ARRAY[2, -3]) as pushkin(x_11), UNNEST(ARRAY[2, -3]) as pushkin(x_7)
WHERE
  (x_7 = x_11) ORDER BY x;