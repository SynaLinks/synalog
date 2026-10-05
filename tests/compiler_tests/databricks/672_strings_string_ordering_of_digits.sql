SELECT
  x_1 AS s
FROM
  LATERAL (SELECT explode(ARRAY("2", "10", "1")) AS x_1) AS pushkin ORDER BY s NULLS LAST;