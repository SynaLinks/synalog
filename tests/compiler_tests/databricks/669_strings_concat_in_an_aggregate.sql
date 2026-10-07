SELECT
  x_3 AS s,
  MAX((CONCAT(x_3, "!"))) AS t
FROM
  LATERAL (SELECT explode(ARRAY("b", "a")) AS x_3) AS pushkin
GROUP BY 1 ORDER BY s NULLS LAST;