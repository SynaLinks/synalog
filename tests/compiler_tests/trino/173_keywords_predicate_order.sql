SELECT
  x_1 AS x
FROM
  UNNEST(ARRAY[2, 1]) as pushkin(x_1) ORDER BY x;