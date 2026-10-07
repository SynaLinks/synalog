SELECT
  x_5 AS x,
  x_7 AS y
FROM
  LATERAL (SELECT explode(ARRAY(0, 1)) AS x_5) AS pushkin, LATERAL (SELECT explode(ARRAY(0, 1)) AS x_7) AS pushkin
WHERE
  ((x_5 = 1) AND (x_7 = 1)) ORDER BY x NULLS LAST, y NULLS LAST;