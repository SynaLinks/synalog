SELECT
  SIGN(x_4) AS s,
  x_4 AS x
FROM
  LATERAL (SELECT explode(ARRAY(5, -5)) AS x_4) AS pushkin ORDER BY x NULLS LAST;