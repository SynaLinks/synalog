SELECT
  x_7 AS n,
  (CONCAT(CAST(x_7 AS STRING), CASE WHEN (x_7 = 1) THEN "st" WHEN (x_7 = 2) THEN "nd" ELSE "th" END)) AS o
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 4)) AS x_7) AS pushkin ORDER BY n NULLS LAST;