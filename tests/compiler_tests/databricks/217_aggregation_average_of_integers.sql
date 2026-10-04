SELECT
  AVG(x_2) AS m
FROM
  explode(ARRAY(1, 2, 3, 4)) AS pushkin(x_2);