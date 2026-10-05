SELECT
  (SELECT
  SUM(x_4) AS logica_value
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_4) AS pushkin
WHERE
  (x_4 > 1)) AS t;