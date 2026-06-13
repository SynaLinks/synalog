SELECT
  x_6 AS x
FROM
  explode(ARRAY(1, 2, 3, 4, 5)) AS pushkin(x_6), explode(ARRAY(3, 4, 5, 6, 7)) AS pushkin(x_8)
WHERE
  (x_8 = x_6) ORDER BY x;