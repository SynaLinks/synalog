SELECT
  x_2 AS x
FROM
  LATERAL (SELECT explode(ARRAY()) AS x_2) AS pushkin
WHERE
  (1 = x_2);