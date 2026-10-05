SELECT
  x_1 AS s
FROM
  LATERAL (SELECT explode(ARRAY("apple", "banana", "blue", "cab")) AS x_1) AS pushkin ORDER BY s NULLS LAST;