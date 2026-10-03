SELECT
  x_1 AS name
FROM
  explode(ARRAY("rome", "paris", "oslo")) AS pushkin(x_1) ORDER BY name;