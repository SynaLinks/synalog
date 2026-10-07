SELECT
  x_4 AS x,
  CASE WHEN (x_4 > 100) THEN "large" WHEN (x_4 > 10) THEN "medium" ELSE "small" END AS size
FROM
  LATERAL (SELECT explode(ARRAY(1, 50, 500)) AS x_4) AS pushkin ORDER BY x NULLS LAST;