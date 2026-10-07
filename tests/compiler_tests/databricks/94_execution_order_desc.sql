SELECT
  x_3 AS s
FROM
  LATERAL (SELECT explode(ARRAY("b", "a", "c")) AS x_3) AS pushkin ORDER BY s DESC;