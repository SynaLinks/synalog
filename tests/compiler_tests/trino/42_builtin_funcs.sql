SELECT
  x_12 AS x,
  SQRT(CAST(x_12 AS DOUBLE)) AS sqrt_x
FROM
  UNNEST(ARRAY[1, 4, 9, 16, 25]) as pushkin(x_12) ORDER BY x;