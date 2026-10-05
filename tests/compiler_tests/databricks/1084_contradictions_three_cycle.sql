SELECT
  x_5 AS a
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_5) AS pushkin, LATERAL (SELECT explode(ARRAY(1, 2)) AS x_7) AS pushkin, LATERAL (SELECT explode(ARRAY(1, 2)) AS x_9) AS pushkin
WHERE
  (x_5 < x_7) AND
  (x_7 < x_9) AND
  (x_9 < x_5);
