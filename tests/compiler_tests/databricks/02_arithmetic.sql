SELECT
  x_15 AS x,
  ((x_15) + (5)) AS plus,
  ((x_15) - (3)) AS sub,
  ((x_15) * (2)) AS mul
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 10), x -> x < 10)) AS x_15) AS pushkin
WHERE
  (x_15 > 0) ORDER BY x NULLS LAST;