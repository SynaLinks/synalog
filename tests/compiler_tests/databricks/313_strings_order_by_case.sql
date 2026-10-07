SELECT
  x_1 AS w
FROM
  LATERAL (SELECT explode(ARRAY("b", "A", "a", "B")) AS x_1) AS pushkin ORDER BY w NULLS LAST;