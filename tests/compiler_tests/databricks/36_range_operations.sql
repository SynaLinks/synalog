SELECT
  x_7 AS x,
  ((x_7) * (x_7)) AS squared
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 5), x -> x < 5)) AS x_7) AS pushkin
WHERE
  (x_7 > 1) ORDER BY x NULLS LAST;