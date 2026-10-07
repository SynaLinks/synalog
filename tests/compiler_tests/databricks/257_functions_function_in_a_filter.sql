SELECT
  x_6 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 4)) AS x_6) AS pushkin
WHERE
  (((x_6) * (x_6)) > 5) ORDER BY x NULLS LAST;