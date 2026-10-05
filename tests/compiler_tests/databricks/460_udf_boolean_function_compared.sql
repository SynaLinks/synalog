SELECT
  x_6 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 4)) AS x_6) AS pushkin
WHERE
  (true = ((MOD(x_6, 2)) = 0)) ORDER BY x NULLS LAST;