SELECT
  x_11 AS x,
  ((x_11) * (x_11)) AS sq
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 5), x -> x < 5)) AS x_11) AS pushkin ORDER BY x NULLS LAST;