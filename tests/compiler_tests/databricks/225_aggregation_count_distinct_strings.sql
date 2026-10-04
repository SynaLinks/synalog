SELECT
  COUNT(DISTINCT x_2) AS n
FROM
  explode(ARRAY("x", "y", "x")) AS pushkin(x_2);