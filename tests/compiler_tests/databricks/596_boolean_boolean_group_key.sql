SELECT
  (x_2 > 3) AS big,
  SUM(1) AS n
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 5)) AS x_2) AS pushkin
GROUP BY 1 ORDER BY big NULLS LAST;