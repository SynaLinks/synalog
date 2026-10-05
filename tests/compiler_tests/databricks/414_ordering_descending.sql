SELECT
  x_1 AS x
FROM
  LATERAL (SELECT explode(ARRAY(2, 3, 1)) AS x_1) AS pushkin ORDER BY x desc;