SELECT
  x_3 AS x
FROM
  explode(ARRAY(4, 1, 9, 7)) AS pushkin(x_3) ORDER BY x DESC LIMIT 2;