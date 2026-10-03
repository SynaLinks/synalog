SELECT
  SUM(1) AS n
FROM
  explode(ARRAY(1, 1, 2)) AS pushkin(x_2) ORDER BY n;