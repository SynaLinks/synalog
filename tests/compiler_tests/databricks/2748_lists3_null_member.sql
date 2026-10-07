SELECT
  x_1 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, null, 3)) AS x_1) AS pushkin
WHERE
  (x_1 IS NOT null) ORDER BY x NULLS LAST;