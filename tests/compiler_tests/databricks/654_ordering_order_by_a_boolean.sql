SELECT
  x_3 AS x,
  (x_3 > 3) AS big
FROM
  LATERAL (SELECT explode(ARRAY(5, 1)) AS x_3) AS pushkin ORDER BY big NULLS LAST;