SELECT
  ((x_8) * (x_8)) AS y
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_8) AS pushkin ORDER BY y NULLS LAST;