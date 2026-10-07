SELECT
  x_2 AS x,
  ((x_2) * (2)) AS y
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_2) AS pushkin ORDER BY x NULLS LAST;