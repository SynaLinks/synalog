SELECT
  x_3 AS x,
  (x_3 > 2) AS big
FROM
  LATERAL (SELECT explode(ARRAY(1, 3)) AS x_3) AS pushkin ORDER BY x NULLS LAST;