SELECT
  x_6 AS x
FROM
  UNNEST(ARRAY[1, 3]) as pushkin(x_6)
WHERE
  NOT (x_6 > 2);