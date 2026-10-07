SELECT
  x_7 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 4)) AS x_7) AS pushkin
WHERE
  ((x_7 < 2) OR (x_7 > 3)) ORDER BY x NULLS LAST;