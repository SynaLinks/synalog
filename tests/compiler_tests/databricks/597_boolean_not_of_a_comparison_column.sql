SELECT
  x_6 AS x
FROM
  LATERAL (SELECT explode(ARRAY(2, 7)) AS x_6) AS pushkin
WHERE
  NOT (x_6 > 5);