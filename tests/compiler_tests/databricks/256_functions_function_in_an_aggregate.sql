SELECT
  SUM(((x_5) * (x_5))) AS t
FROM
  explode(ARRAY(1, 2, 3)) AS pushkin(x_5);