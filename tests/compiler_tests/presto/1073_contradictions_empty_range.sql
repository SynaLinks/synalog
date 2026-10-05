SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 7, 12]) as pushkin(x_3)
WHERE
  (x_3 > 10) AND
  (x_3 < 5);