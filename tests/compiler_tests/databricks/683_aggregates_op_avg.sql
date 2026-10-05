SELECT
  AVG(x_2) AS v
FROM
  LATERAL (SELECT explode(ARRAY(4, 1, 7, 1)) AS x_2) AS pushkin;