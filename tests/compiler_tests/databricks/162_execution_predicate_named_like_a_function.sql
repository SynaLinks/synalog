SELECT
  x_7 AS x,
  ABS(x_7) AS y,
  100 AS z
FROM
  LATERAL (SELECT explode(ARRAY(2, -3)) AS x_11) AS pushkin, LATERAL (SELECT explode(ARRAY(2, -3)) AS x_7) AS pushkin
WHERE
  (x_7 = x_11) ORDER BY x NULLS LAST;