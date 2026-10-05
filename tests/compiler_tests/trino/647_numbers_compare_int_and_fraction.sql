SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2, 3]) as pushkin(x_3)
WHERE
  (x_3 > 1.5E0) ORDER BY x;