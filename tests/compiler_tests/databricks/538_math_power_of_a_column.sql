SELECT
  x_3 AS x,
  (POW(x_3, 2)) AS p
FROM
  LATERAL (SELECT explode(ARRAY(2, 3)) AS x_3) AS pushkin ORDER BY x NULLS LAST;