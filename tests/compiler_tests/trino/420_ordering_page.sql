SELECT
  x_1 AS x
FROM
  UNNEST(ARRAY[40, 10, 30, 20]) as pushkin(x_1) ORDER BY x;