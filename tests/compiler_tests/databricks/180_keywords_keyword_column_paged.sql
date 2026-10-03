SELECT
  x_1 AS `order`
FROM
  explode(ARRAY(2, 3, 1, 4)) AS pushkin(x_1) ORDER BY `order`;