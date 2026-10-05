SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[2, 3, 4]) as pushkin(x_3)
WHERE
  (x_3 >= 3) AND
  (x_3 <= 3);