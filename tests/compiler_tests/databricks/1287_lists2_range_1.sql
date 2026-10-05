SELECT
  x_1 AS x
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 1), x -> x < 1)) AS x_1) AS pushkin;
