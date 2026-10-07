SELECT
  COUNT(DISTINCT x_2) AS n
FROM
  LATERAL (SELECT explode(ARRAY("x", "y", "x")) AS x_2) AS pushkin;