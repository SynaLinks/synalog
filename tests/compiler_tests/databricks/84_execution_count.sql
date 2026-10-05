SELECT
  SUM(1) AS n
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_1) AS pushkin;