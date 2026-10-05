SELECT
  x_5 AS a,
  x_7 AS b
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_5) AS pushkin, LATERAL (SELECT explode(ARRAY(1, 2)) AS x_7) AS pushkin
WHERE
  (x_5 = x_7) ORDER BY a NULLS LAST, b NULLS LAST;