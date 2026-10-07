SELECT
  x_3 AS x,
  (MOD(x_3, NULLIF(3, 0))) AS r
FROM
  LATERAL (SELECT explode(ARRAY(-7, 7)) AS x_3) AS pushkin ORDER BY x NULLS LAST;