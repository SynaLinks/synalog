SELECT
  x_3 AS g,
  SUM(1) AS n
FROM
  LATERAL (SELECT explode(ARRAY("a", "b", "b", "b", "c")) AS x_3) AS pushkin
GROUP BY 1 ORDER BY n desc LIMIT 1;