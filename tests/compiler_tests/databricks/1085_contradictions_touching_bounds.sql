SELECT
  x_3 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_3) AS pushkin
WHERE
  (x_3 < 1.5E0) AND
  (x_3 > 1.5E0);
