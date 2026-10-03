SELECT
  x_7 AS x,
  ((x_7) + (1)) AS y
FROM
  explode(ARRAY(1, 2)) AS pushkin(x_7) ORDER BY x;