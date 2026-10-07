SELECT
  x_5 AS k,
  SUM(x_6) AS t
FROM
  LATERAL (SELECT explode(ARRAY("a")) AS x_5) AS pushkin, LATERAL (SELECT explode(ARRAY(1, 2)) AS x_6) AS pushkin
WHERE
  (x_6 > 10)
GROUP BY 1;