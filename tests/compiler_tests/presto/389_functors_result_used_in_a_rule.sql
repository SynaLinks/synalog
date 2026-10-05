SELECT
  ((2) * (x_4)) AS y
FROM
  UNNEST(ARRAY[1, 2, 3]) as pushkin(x_4)
WHERE
  (((2) * (x_4)) > 4);