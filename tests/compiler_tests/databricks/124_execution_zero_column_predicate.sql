SELECT
  x_3 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_3) AS pushkin, LATERAL (SELECT explode(ARRAY(1, 2)) AS x_6) AS pushkin
WHERE
  (2 = x_6) ORDER BY x NULLS LAST;