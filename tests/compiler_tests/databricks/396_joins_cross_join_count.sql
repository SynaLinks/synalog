SELECT
  SUM(1) AS n
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_3) AS pushkin, LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_5) AS pushkin;