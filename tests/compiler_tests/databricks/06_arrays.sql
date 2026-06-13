SELECT
  x_9 AS c,
  (ARRAY_CONTAINS(x_9, ARRAY("red", "blue", "yellow"))) AS is_primary
FROM
  explode(ARRAY("red", "green", "blue")) AS pushkin(x_9) ORDER BY c;