SELECT
  MAX(x_2) AS n
FROM
  explode(ARRAY("apple", "pear", "fig")) AS pushkin(x_2);