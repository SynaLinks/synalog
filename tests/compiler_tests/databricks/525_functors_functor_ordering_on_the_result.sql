SELECT
  ((2) * (x_2)) AS y
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_2) AS pushkin ORDER BY y desc;