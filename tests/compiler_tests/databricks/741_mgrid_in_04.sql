SELECT
  x_2 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 1)) AS x_2) AS pushkin, LATERAL (SELECT explode(ARRAY(1)) AS x_4) AS pushkin
WHERE
  (x_4 = x_2) ORDER BY x NULLS LAST;