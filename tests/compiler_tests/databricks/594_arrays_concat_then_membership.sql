SELECT
  x_3 AS x
FROM
  LATERAL (SELECT explode(CONCAT(ARRAY(1, 2), ARRAY(3))) AS x_3) AS pushkin
WHERE
  (x_3 > 2);