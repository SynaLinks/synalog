SELECT
  x_1 AS p
FROM
  LATERAL (SELECT explode(SPLIT("c,a,b", REGEXP_REPLACE(",", '([^a-zA-Z0-9])', '\\\\$1'))) AS x_1) AS pushkin ORDER BY p NULLS LAST;
