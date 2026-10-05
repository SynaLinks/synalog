SELECT
  x_7 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 4]) as pushkin(x_7)
WHERE
  (((MOD(x_7, 2)) = 0) AND (x_7 > 2));