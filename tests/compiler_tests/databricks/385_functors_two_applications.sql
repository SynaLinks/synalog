SELECT
  SUM(x_2) AS t
FROM
  LATERAL (SELECT explode(ARRAY(10, 20)) AS x_2) AS pushkin;