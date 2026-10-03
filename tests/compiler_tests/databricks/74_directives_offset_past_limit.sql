SELECT
  x_1 AS x
FROM
  explode(ARRAY(5, 3, 1, 4, 2)) AS pushkin(x_1) ORDER BY x LIMIT 3;