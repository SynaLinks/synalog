SELECT
  x_1 AS x,
  - x_1 AS y
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_1) AS pushkin ORDER BY y NULLS LAST;