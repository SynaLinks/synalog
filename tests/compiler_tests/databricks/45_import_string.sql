SELECT
  x_10 AS name,
  (CONCAT((CONCAT("Hello, ", x_10)), "!")) AS message
FROM
  explode(ARRAY("Alice", "Bob", "Charlie")) AS pushkin(x_10) ORDER BY name;