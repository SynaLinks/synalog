SELECT
  x_3 AS x,
  CASE WHEN (((x_3 > 1) AND (x_3 < 4)) OR (x_3 = 10)) THEN 1 ELSE 0 END AS y
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 10)) AS x_3) AS pushkin ORDER BY x NULLS LAST;