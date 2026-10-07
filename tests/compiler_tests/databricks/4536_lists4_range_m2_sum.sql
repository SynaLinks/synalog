SELECT
  SUM(x_0) AS s
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, CAST(-2 AS BIGINT)), x -> x < -2)) AS x_0) AS pushkin;