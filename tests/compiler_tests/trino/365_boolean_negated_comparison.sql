SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2, 3]) as pushkin(x_3)
WHERE
  NOT (x_3 > 2) ORDER BY x;