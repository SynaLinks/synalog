SELECT
  x_1 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_1) AS pushkin LIMIT 0;