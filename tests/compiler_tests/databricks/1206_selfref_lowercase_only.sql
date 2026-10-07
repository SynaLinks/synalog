SELECT
  x_1 AS s
FROM
  LATERAL (SELECT explode(ARRAY("a", "B", "c")) AS x_1) AS pushkin
WHERE
  (x_1 = LOWER(x_1)) ORDER BY s NULLS LAST;
