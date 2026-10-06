SELECT
  SUM(1) AS c
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 3), x -> x < 3)) AS x_0) AS pushkin, LATERAL (SELECT explode(FILTER(SEQUENCE(0, 3), x -> x < 3)) AS x_1) AS pushkin
WHERE
  (x_0 < x_1);