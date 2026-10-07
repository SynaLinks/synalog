SELECT
  x_4 AS a
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_4) AS pushkin, LATERAL (SELECT explode(ARRAY(1, 2)) AS x_6) AS pushkin
WHERE
  (x_4 <= x_6) AND
  (x_6 <= x_4) AND
  (x_4 != x_6);
