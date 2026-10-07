SELECT
  MIN(x_2) AS m
FROM
  LATERAL (SELECT explode(ARRAY("pear", "apple", "fig")) AS x_2) AS pushkin;