SELECT
  x_1.a.n AS n,
  x_1.a.v AS v
FROM
  LATERAL (SELECT explode(ARRAY(STRUCT(STRUCT("p" AS n, 1 AS v) AS a), STRUCT(STRUCT("q" AS n, 2 AS v) AS a))) AS x_1) AS pushkin ORDER BY n NULLS LAST;