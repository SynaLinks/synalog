SELECT
  x_1.p.n AS n,
  x_1.p.v AS v
FROM
  UNNEST(ARRAY[STRUCT(STRUCT("x" AS n, 1 AS v) AS p), STRUCT(STRUCT("y" AS n, 2 AS v) AS p)]) as x_1 ORDER BY n;