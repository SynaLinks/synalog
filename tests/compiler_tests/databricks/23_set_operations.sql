SELECT
  x_6 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 4, 5)) AS x_6) AS pushkin, LATERAL (SELECT explode(ARRAY(3, 4, 5, 6, 7)) AS x_8) AS pushkin
WHERE
  (x_8 = x_6) ORDER BY x NULLS LAST;