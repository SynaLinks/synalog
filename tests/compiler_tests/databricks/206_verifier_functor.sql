SELECT
  SUM(1) AS n
FROM
  explode(ARRAY(1, 3)) AS pushkin(x_2);