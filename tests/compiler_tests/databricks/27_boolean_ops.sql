SELECT
  x_8 AS x,
  CASE WHEN (x_8 > 7) THEN "very_high" WHEN (x_8 > 4) THEN "high" WHEN (x_8 > 1) THEN "medium" ELSE "low" END AS cat
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 10), x -> x < 10)) AS x_8) AS pushkin ORDER BY x NULLS LAST;