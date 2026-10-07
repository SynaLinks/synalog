SELECT
  x_3 AS x
FROM
  LATERAL (SELECT explode(ARRAY(4, 16)) AS x_3) AS pushkin
WHERE
  (SQRT(x_3) > 3);