SELECT
  MIN(x_2) AS m
FROM
  explode(ARRAY("pear", "apple", "fig")) AS pushkin(x_2);