SELECT
  x_8 AS col0,
  ((x_8) + (1)) AS col1
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 5), x -> x < 5)) AS x_8) AS pushkin ORDER BY col0 NULLS LAST;