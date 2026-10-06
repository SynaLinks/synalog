SELECT
  x_4 AS x,
  ((x_4) / NULLIF((SELECT
  SUM(x_7) AS logica_value
FROM
  LATERAL (SELECT explode(ARRAY(1, 3)) AS x_7) AS pushkin), 0)) AS s
FROM
  LATERAL (SELECT explode(ARRAY(1, 3)) AS x_4) AS pushkin ORDER BY x NULLS LAST;