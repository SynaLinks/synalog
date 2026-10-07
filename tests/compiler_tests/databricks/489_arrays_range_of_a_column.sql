SELECT
  x_5 AS n,
  x_3 AS i
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_5) AS pushkin, LATERAL (SELECT explode(FILTER(SEQUENCE(0, CAST(x_5 AS BIGINT)), x -> x < x_5)) AS x_3) AS pushkin ORDER BY n NULLS LAST, i NULLS LAST;