SELECT
  x_1 AS s
FROM
  LATERAL (SELECT explode(ARRAY("b", "B", "a", "A", "_", "1", "é", "ab", "aB")) AS x_1) AS pushkin ORDER BY s NULLS LAST;
