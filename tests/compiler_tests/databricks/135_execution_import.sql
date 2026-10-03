SELECT
  ((2) * (x_2)) AS y
FROM
  explode(ARRAY(1, 2)) AS pushkin(x_2) ORDER BY y;