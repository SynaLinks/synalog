SELECT
  SUM(x_2) AS t
FROM
  explode(ARRAY(1, 2)) AS pushkin(x_2)
WHERE
  (x_2 > 10);