SELECT
  x_1 AS p
FROM
  LATERAL (SELECT explode(SPLIT("c,a,b", ",")) AS x_1) AS pushkin ORDER BY p NULLS LAST;