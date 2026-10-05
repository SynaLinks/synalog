SELECT
  x_2 AS a,
  x_3 AS b
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 4), x -> x < 4)) AS x_2) AS pushkin, LATERAL (SELECT explode(FILTER(SEQUENCE(0, 4), x -> x < 4)) AS x_3) AS pushkin
WHERE
  (x_2 < x_3) ORDER BY a NULLS LAST, b NULLS LAST;
