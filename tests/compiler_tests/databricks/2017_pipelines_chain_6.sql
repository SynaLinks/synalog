SELECT
  x_15 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) AS x_15) AS pushkin
WHERE
  (NOT (x_15 <=> 6)) AND
  (NOT (x_15 <=> 5)) AND
  (NOT (x_15 <=> 4)) AND
  (NOT (x_15 <=> 3)) AND
  (NOT (x_15 <=> 2)) AND
  (NOT (x_15 <=> 1)) ORDER BY x NULLS LAST;
