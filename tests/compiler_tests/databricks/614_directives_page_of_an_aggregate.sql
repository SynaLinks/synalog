SELECT
  x_3 AS g,
  SUM(1) AS n
FROM
  LATERAL (SELECT explode(ARRAY("a", "a", "b", "c")) AS x_3) AS pushkin
GROUP BY 1 ORDER BY g NULLS LAST;