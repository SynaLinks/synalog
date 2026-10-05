SELECT
  x_1 AS part
FROM
  LATERAL (SELECT explode(SPLIT("x.y.z", REGEXP_REPLACE(".", '([^a-zA-Z0-9])', '\\\\$1'))) AS x_1) AS pushkin
GROUP BY 1 ORDER BY part NULLS LAST;
