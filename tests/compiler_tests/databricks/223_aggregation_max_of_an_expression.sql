SELECT
  MAX(((x_2) * (x_2))) AS m
FROM
  LATERAL (SELECT explode(ARRAY(1, -3, 2)) AS x_2) AS pushkin;