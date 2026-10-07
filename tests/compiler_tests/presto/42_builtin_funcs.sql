SELECT
  x_12 AS x,
  SQRT(CAST(x_12 AS DOUBLE)) AS sqrt_x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 4, 9, 16, 25], synalog_e -> ROW(synalog_e))) as pushkin(x_12) ORDER BY x;