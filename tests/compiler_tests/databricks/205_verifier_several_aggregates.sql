SELECT
  x_5 AS c,
  SUM(x_6) AS total,
  SUM(1) AS n,
  MAX(x_6) AS top,
  MIN(x_6) AS low
FROM
  LATERAL (SELECT explode(ARRAY("a", "b")) AS x_5) AS pushkin, LATERAL (SELECT explode(ARRAY(1, 2)) AS x_6) AS pushkin
GROUP BY 1 ORDER BY c NULLS LAST;