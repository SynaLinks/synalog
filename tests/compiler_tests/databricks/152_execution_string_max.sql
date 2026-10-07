SELECT
  MAX(x_2) AS n
FROM
  LATERAL (SELECT explode(ARRAY("apple", "pear", "fig")) AS x_2) AS pushkin;