SELECT
  2 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_3) AS pushkin
WHERE
  (x_3 = 2) AND
  (2 = 2.0E0);
