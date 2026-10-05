SELECT
  x_2 AS x
FROM
  UNNEST(ARRAY[1, 1]) as pushkin(x_2), UNNEST(ARRAY[1]) as pushkin(x_4)
WHERE
  (x_4 = x_2) ORDER BY x;