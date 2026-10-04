SELECT
  x_5 AS a,
  x_7 AS b
FROM
  explode(ARRAY(1, 2, 3)) AS pushkin(x_5), explode(ARRAY(1, 2, 3)) AS pushkin(x_7)
WHERE
  (x_5 < x_7) ORDER BY a, b;