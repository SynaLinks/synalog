SELECT
  x_1 AS x
FROM
  UNNEST(ARRAY[5, 2, 1, 4]) as pushkin(x_1) ORDER BY x LIMIT 2;