SELECT
  x_5 AS g,
  SUM(x_6) AS t
FROM
  LATERAL (SELECT explode(ARRAY("a")) AS x_5) AS pushkin, LATERAL (SELECT explode(ARRAY(1)) AS x_6) AS pushkin
WHERE
  (x_6 > 5)
GROUP BY 1 ORDER BY g NULLS LAST;