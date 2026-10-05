SELECT
  x_1 AS name
FROM
  LATERAL (SELECT explode(ARRAY("rome", "paris", "oslo")) AS x_1) AS pushkin ORDER BY name NULLS LAST;