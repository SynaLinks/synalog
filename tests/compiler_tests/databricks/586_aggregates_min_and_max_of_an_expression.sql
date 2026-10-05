SELECT
  MIN(x_2) AS lo,
  MAX(- ((x_2) * (-1))) AS hi
FROM
  LATERAL (SELECT explode(ARRAY(-3, 1, 3)) AS x_2) AS pushkin;