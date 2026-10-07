SELECT
  x_7 AS x,
  ((x_7) + (1)) AS y
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_7) AS pushkin ORDER BY x NULLS LAST;