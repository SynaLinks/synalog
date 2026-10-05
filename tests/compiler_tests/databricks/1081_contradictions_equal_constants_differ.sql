SELECT
  1 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_3) AS pushkin
WHERE
  (1 != 1.0E0) AND
  (x_3 = 1);
