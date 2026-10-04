SELECT
  x_1 AS x
FROM
  UNNEST(ARRAY[1, 2, 12]) as pushkin(x_1) ORDER BY x;