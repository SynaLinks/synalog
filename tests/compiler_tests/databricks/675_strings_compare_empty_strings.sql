SELECT
  x_1 AS s
FROM
  LATERAL (SELECT explode(ARRAY("a", "")) AS x_1) AS pushkin ORDER BY s NULLS LAST;