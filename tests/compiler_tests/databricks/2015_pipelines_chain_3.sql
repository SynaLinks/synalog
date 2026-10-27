SELECT
  x_9 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) AS x_9) AS pushkin
WHERE
  (NOT (x_9 <=> 3)) AND
  (NOT (x_9 <=> 2)) AND
  (NOT (x_9 <=> 1)) ORDER BY x NULLS LAST;
