SELECT
  SUM(x_0) AS s
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 10), x -> x < 10)) AS x_0) AS pushkin;
