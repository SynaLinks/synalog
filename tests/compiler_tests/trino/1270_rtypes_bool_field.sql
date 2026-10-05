SELECT
  x_1 AS n
FROM
  UNNEST(ARRAY[10, 9]) as pushkin(x_1)
WHERE
  ((x_1 > 9) = true);