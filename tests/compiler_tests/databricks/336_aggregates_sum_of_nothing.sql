SELECT
  SUM(x_2) AS t
FROM
  LATERAL (SELECT explode(ARRAY(1)) AS x_2) AS pushkin
WHERE
  (x_2 > 5);