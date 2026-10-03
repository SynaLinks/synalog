SELECT
  x_2 AS x,
  ((x_2) * (2)) AS y
FROM
  explode(ARRAY(1, 2)) AS pushkin(x_2) ORDER BY x;