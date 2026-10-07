SELECT
  x_1 AS s
FROM
  LATERAL (SELECT explode(ARRAY("a'b", "x\\\\'y", "plain", "); DROP")) AS x_1) AS pushkin ORDER BY s NULLS LAST;
