SELECT
  x_12.value AS x,
  SQRT(CAST(x_12.value AS FLOAT64)) AS sqrt_x
FROM
  JSON_EACH(JSON_ARRAY(1, 4, 9, 16, 25)) as x_12 ORDER BY x;