SELECT
  x_1 AS `group`
FROM
  explode(ARRAY("a", "b")) AS pushkin(x_1) ORDER BY `group`;