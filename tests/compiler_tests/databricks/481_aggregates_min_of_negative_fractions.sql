SELECT
  MIN(x_2) AS m
FROM
  LATERAL (SELECT explode(ARRAY(-1.5E0, -2.5E0, 0.5E0)) AS x_2) AS pushkin;