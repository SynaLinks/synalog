SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[4, 16]) as pushkin(x_3)
WHERE
  (SQRT(x_3) > 3);