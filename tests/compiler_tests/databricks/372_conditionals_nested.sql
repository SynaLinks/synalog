SELECT
  x_3 AS x,
  CASE WHEN (x_3 = 1) THEN "one" WHEN (x_3 = 2) THEN "two" ELSE "many" END AS w
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_3) AS pushkin ORDER BY x NULLS LAST;