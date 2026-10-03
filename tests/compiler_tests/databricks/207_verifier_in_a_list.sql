SELECT
  x_2 AS x
FROM
  explode(ARRAY(1, 2)) AS pushkin(x_2), explode(ARRAY(1, 2, 3)) AS pushkin(x_4)
WHERE
  (x_4 = x_2) ORDER BY x;