SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2]) as pushkin(x_3), UNNEST(ARRAY[1, 2]) as pushkin(x_6)
WHERE
  (2 = x_6) ORDER BY x;