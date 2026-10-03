SELECT
  x_3 AS x
FROM
  explode(ARRAY(1, 2, 3, 4, 5)) AS pushkin(x_3)
WHERE
  (x_3 > 2) AND
  (x_3 <= 4) ORDER BY x;