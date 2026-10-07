SELECT
  x_1 AS x
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, CAST(1 AS BIGINT)), x -> x < 1)) AS x_1) AS pushkin;