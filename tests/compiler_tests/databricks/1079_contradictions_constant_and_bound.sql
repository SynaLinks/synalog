SELECT
  2 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_3) AS pushkin
WHERE
  (2 > 3) AND
  (x_3 = 2);
