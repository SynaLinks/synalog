SELECT
  x_1 AS x
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 10), x -> x < 10)) AS x_1) AS pushkin
WHERE
  (x_1 > 0) AND
  ((MOD(x_1, NULLIF(3, 0))) = 0) ORDER BY x NULLS LAST;