SELECT
  x_1 AS s
FROM
  LATERAL (SELECT explode(ARRAY("ant", "zag", "bee", "bar")) AS x_1) AS pushkin ORDER BY s desc;