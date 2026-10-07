SELECT
  x_3 AS s,
  CASE WHEN (x_3 < "h") THEN "early" ELSE "late" END AS w
FROM
  LATERAL (SELECT explode(ARRAY("a", "m")) AS x_3) AS pushkin ORDER BY s NULLS LAST;