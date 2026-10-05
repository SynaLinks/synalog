SELECT
  x_3 AS x,
  CASE WHEN (x_3 < 2) THEN "small" ELSE null END AS w
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_3) AS pushkin ORDER BY x NULLS LAST;