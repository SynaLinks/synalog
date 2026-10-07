SELECT
  ((2) * (((2) * (x_7)))) AS y
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_7) AS pushkin ORDER BY y NULLS LAST;