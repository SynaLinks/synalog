SELECT
  x_12 AS x,
  SQRT(CAST(x_12 AS DOUBLE)) AS sqrt_x
FROM
  explode(ARRAY(1, 4, 9, 16, 25)) AS pushkin(x_12) ORDER BY x;