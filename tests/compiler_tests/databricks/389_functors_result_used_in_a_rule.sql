SELECT
  ((2) * (x_4)) AS y
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_4) AS pushkin
WHERE
  (((2) * (x_4)) > 4);