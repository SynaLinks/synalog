SELECT
  (SELECT
  SUM(x_4) AS logica_value
FROM
  LATERAL (SELECT explode(ARRAY(1)) AS x_4) AS pushkin
WHERE
  (x_4 > 5)) AS t;