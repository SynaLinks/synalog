SELECT
  x_4 AS x,
  CASE WHEN (x_4 < 0) THEN "neg" WHEN (x_4 = 0) THEN "zero" ELSE "pos" END AS s
FROM
  LATERAL (SELECT explode(ARRAY(3, -2, 0)) AS x_4) AS pushkin ORDER BY x NULLS LAST;