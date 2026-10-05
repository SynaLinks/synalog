SELECT
  AVG(x_2) AS m
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 4)) AS x_2) AS pushkin;