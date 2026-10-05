SELECT
  (SELECT
  SUM(1) AS logica_value
FROM
  LATERAL (SELECT explode(ARRAY(5, 6, 7)) AS x_4) AS pushkin) AS n;