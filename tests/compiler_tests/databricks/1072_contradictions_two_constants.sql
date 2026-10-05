SELECT
  1 AS k
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_3) AS pushkin
WHERE
  (x_3 = 1) AND
  (1 = 2);
