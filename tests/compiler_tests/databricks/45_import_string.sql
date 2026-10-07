SELECT
  x_10 AS name,
  (CONCAT((CONCAT("Hello, ", x_10)), "!")) AS message
FROM
  LATERAL (SELECT explode(ARRAY("Alice", "Bob", "Charlie")) AS x_10) AS pushkin ORDER BY name NULLS LAST;