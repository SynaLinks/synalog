SELECT
  2 AS x
FROM
  UNNEST(ARRAY[1, 2]) as pushkin(x_3)
WHERE
  (2 > 3) AND
  (x_3 = 2);