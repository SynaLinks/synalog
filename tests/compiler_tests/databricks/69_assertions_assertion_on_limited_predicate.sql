SELECT
  x_3 AS x
FROM
  explode(ARRAY(1, 2, 3)) AS pushkin(x_3) ORDER BY x LIMIT 1;