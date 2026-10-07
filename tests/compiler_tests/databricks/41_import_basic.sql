SELECT
  x_15 AS x,
  ((x_15) * (2)) AS doubled,
  ((x_15) * (x_15)) AS squared
FROM
  LATERAL (SELECT explode(ARRAY(2, 3, 4)) AS x_15) AS pushkin ORDER BY x NULLS LAST;