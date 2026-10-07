SELECT
  x_6 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 3)) AS x_6) AS pushkin
WHERE
  NOT (x_6 > 2);