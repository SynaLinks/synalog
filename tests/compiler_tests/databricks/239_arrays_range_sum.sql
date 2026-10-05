SELECT
  SUM(x_0) AS t
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 5), x -> x < 5)) AS x_0) AS pushkin;