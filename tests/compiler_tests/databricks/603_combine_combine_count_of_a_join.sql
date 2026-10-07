SELECT
  (SELECT
  SUM(1) AS logica_value
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_5) AS pushkin, LATERAL (SELECT explode(ARRAY(2, 3, 4)) AS x_7) AS pushkin
WHERE
  (x_7 = x_5)) AS n;