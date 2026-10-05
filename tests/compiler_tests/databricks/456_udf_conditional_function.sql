SELECT
  x_3 AS x,
  SIGN(x_3) AS s
FROM
  LATERAL (SELECT explode(ARRAY(-2, 0, 5)) AS x_3) AS pushkin ORDER BY x NULLS LAST;