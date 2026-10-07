SELECT
  MAX(x_1) AS m
FROM
  LATERAL (SELECT explode(ARRAY(100, 9, 10)) AS x_1) AS pushkin;
