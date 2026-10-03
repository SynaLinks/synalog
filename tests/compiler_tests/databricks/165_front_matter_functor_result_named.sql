SELECT
  SUM(1) AS n
FROM
  explode(ARRAY(3)) AS pushkin(x_2) ORDER BY n;