SELECT
  (SELECT
  MAX(x_4) AS logica_value
FROM
  LATERAL (SELECT explode(ARRAY(4, 9, 2)) AS x_4) AS pushkin) AS m;