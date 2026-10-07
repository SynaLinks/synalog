SELECT
  x_4 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_4) AS pushkin, LATERAL (SELECT explode(ARRAY(1)) AS x_6) AS pushkin
WHERE
  (x_6 > 5) AND
  (x_6 = x_4) ORDER BY x NULLS LAST;