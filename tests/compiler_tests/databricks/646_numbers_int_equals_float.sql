SELECT
  2.0E0 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_3) AS pushkin
WHERE
  (x_3 = 2.0E0);