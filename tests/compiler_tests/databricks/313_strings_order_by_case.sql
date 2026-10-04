SELECT
  x_1 AS w
FROM
  explode(ARRAY("b", "A", "a", "B")) AS pushkin(x_1) ORDER BY w;