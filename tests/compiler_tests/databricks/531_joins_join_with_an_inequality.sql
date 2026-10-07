SELECT
  x_5 AS a,
  x_7 AS b
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_5) AS pushkin, LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_7) AS pushkin
WHERE
  (x_7 > x_5) ORDER BY a NULLS LAST, b NULLS LAST;