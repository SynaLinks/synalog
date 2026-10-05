SELECT
  2.0E0 AS x
FROM
  UNNEST(ARRAY[1, 2]) as pushkin(x_3)
WHERE
  (x_3 = 2.0E0);