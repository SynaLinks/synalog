SELECT
  AVG(x_2) AS a
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_2) AS pushkin;