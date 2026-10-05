SELECT
  x_6 AS x
FROM
  UNNEST(ARRAY[2, 7]) as pushkin(x_6)
WHERE
  NOT (x_6 > 5);