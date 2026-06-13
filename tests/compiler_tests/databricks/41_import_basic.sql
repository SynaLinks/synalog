SELECT
  x_15 AS x,
  ((x_15) * (2)) AS doubled,
  ((x_15) * (x_15)) AS squared
FROM
  explode(ARRAY(2, 3, 4)) AS pushkin(x_15) ORDER BY x;