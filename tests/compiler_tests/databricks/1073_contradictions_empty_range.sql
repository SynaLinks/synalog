SELECT
  x_3 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 7, 12)) AS x_3) AS pushkin
WHERE
  (x_3 > 10) AND
  (x_3 < 5);
