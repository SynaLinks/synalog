SELECT
  SUM(1) AS n
FROM
  explode(ARRAY(1, 2)) AS pushkin(x_3), explode(ARRAY("a", "b", "c")) AS pushkin(x_5);