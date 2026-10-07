SELECT
  x_3 AS t,
  ARRAY_SIZE(SPLIT(x_3, REGEXP_REPLACE(",", '([^a-zA-Z0-9])', '\\\\$1'))) AS n
FROM
  LATERAL (SELECT explode(ARRAY("x", "a,b,c")) AS x_3) AS pushkin ORDER BY t NULLS LAST;
