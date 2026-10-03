SELECT
  x_3 AS s
FROM
  explode(ARRAY("b", "a", "c")) AS pushkin(x_3) ORDER BY s DESC;