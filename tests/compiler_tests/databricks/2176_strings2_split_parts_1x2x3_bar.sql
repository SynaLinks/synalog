SELECT
  x_1 AS part
FROM
  LATERAL (SELECT explode(SPLIT("1|2|3", REGEXP_REPLACE("|", '([^a-zA-Z0-9])', '\\\\$1'))) AS x_1) AS pushkin
GROUP BY 1 ORDER BY part NULLS LAST;
