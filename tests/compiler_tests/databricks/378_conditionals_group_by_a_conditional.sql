SELECT
  CASE WHEN (x_2 > 5) THEN "big" ELSE "small" END AS size,
  SUM(1) AS n
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 10, 20)) AS x_2) AS pushkin
GROUP BY 1 ORDER BY size NULLS LAST;