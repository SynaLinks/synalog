SELECT
  x_7 AS x,
  ABS(x_7) AS y,
  100 AS z
FROM
  explode(ARRAY(2, -3)) AS pushkin(x_11), explode(ARRAY(2, -3)) AS pushkin(x_7)
WHERE
  (x_7 = x_11) ORDER BY x;