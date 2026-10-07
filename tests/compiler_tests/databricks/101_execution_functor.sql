SELECT
  SUM(1) AS n
FROM
  LATERAL (SELECT explode(ARRAY(1, 3)) AS x_2) AS pushkin;