SELECT
  x_1 AS x
FROM
  UNNEST(ARRAY[5, 3, 1, 4, 2]) as pushkin(x_1) ORDER BY x LIMIT 3;