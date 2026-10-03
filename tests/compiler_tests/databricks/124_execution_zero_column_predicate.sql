SELECT
  x_3 AS x
FROM
  explode(ARRAY(1, 2)) AS pushkin(x_3), explode(ARRAY(1, 2)) AS pushkin(x_6)
WHERE
  (2 = x_6) ORDER BY x;