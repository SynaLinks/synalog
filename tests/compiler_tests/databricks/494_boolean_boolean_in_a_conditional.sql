SELECT
  x_6 AS x,
  CASE WHEN (x_6 > 2) THEN "big" ELSE "small" END AS w
FROM
  LATERAL (SELECT explode(ARRAY(1, 3)) AS x_6) AS pushkin ORDER BY x NULLS LAST;