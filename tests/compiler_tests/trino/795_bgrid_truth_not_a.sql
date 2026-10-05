SELECT
  x_5 AS x,
  x_7 AS y
FROM
  UNNEST(ARRAY[0, 1]) as pushkin(x_5), UNNEST(ARRAY[0, 1]) as pushkin(x_7)
WHERE
  NOT (x_5 = 1) ORDER BY x, y;