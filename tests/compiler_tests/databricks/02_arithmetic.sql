SELECT
  x_15 AS x,
  ((x_15) + (5)) AS plus,
  ((x_15) - (3)) AS sub,
  ((x_15) * (2)) AS mul
FROM
  explode(GENERATE_ARRAY(0, 10 - 1)) AS pushkin(x_15)
WHERE
  (x_15 > 0) ORDER BY x;