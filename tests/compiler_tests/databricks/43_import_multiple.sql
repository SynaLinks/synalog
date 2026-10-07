SELECT
  x_11 AS x,
  ((x_11) * (2)) AS doubled
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 4, 5)) AS x_11) AS pushkin
WHERE
  (x_11 > 0) ORDER BY x NULLS LAST;