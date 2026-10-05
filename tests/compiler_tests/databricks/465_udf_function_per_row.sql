SELECT
  x_7 AS x,
  ((((2) * (x_7))) + (1)) AS y
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_7) AS pushkin ORDER BY x NULLS LAST;