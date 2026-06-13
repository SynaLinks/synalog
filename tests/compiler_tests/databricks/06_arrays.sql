SELECT
  x_9 AS c,
  (ARRAY_CONTAINS(ARRAY("red", "blue", "yellow"), x_9)) AS is_primary
FROM
  explode(ARRAY("red", "green", "blue")) AS pushkin(x_9) ORDER BY c;