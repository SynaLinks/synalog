SELECT
  x_9 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) AS x_9) AS pushkin
WHERE
  (x_9 != 3) AND
  (x_9 != 2) AND
  (x_9 != 1) ORDER BY x NULLS LAST;
