SELECT
  SUM(x_2) AS t
FROM
  explode(ARRAY(0.1, 0.2, 0.3)) AS pushkin(x_2);