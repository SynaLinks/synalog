SELECT
  x_3 AS x
FROM
  explode(ARRAY(1, 2, 3, 4, 5)) AS pushkin(x_3) ORDER BY x DESC LIMIT 3;