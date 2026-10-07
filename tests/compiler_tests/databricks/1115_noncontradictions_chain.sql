SELECT
  x_7 AS a,
  x_9 AS b,
  x_11 AS c
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_11) AS pushkin, LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_7) AS pushkin, LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_9) AS pushkin
WHERE
  (x_7 < x_9) AND
  (x_9 < x_11);
