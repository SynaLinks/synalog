SELECT
  MIN(x_2) AS lo,
  MAX(x_2) AS hi
FROM
  LATERAL (SELECT explode(ARRAY(4, 1, 9, 7)) AS x_2) AS pushkin;