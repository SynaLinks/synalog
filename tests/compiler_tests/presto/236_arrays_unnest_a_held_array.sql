SELECT
  x_2 AS x
FROM
  UNNEST(ARRAY[3, 1]) as pushkin(x_2) ORDER BY x;