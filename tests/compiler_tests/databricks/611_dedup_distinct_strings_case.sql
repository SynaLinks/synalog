SELECT
  x_3 AS s
FROM
  LATERAL (SELECT explode(ARRAY("a", "A", "a")) AS x_3) AS pushkin
GROUP BY 1 ORDER BY s NULLS LAST;