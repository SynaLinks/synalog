SELECT
  ARRAY_SIZE((SELECT
  ARRAY_AGG(x_3) AS logica_value
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_3) AS pushkin)) AS n;