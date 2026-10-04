SELECT
  MAX(((x_2) * (x_2))) AS m
FROM
  explode(ARRAY(1, -3, 2)) AS pushkin(x_2);