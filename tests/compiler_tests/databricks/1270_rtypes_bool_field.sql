SELECT
  x_1 AS n
FROM
  LATERAL (SELECT explode(ARRAY(10, 9)) AS x_1) AS pushkin
WHERE
  ((x_1 > 9) = true);
