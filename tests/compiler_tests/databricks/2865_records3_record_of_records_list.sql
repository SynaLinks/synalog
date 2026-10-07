SELECT
  x_1.p.n AS n,
  x_1.p.v AS v
FROM
  LATERAL (SELECT explode(ARRAY(STRUCT(STRUCT("x" AS n, 1 AS v) AS p), STRUCT(STRUCT("y" AS n, 2 AS v) AS p))) AS x_1) AS pushkin ORDER BY n NULLS LAST;