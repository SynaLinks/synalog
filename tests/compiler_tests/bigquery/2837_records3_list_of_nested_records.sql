SELECT
  x_1.a.n AS n,
  x_1.a.v AS v
FROM
  UNNEST(ARRAY[STRUCT(STRUCT("p" AS n, 1 AS v) AS a), STRUCT(STRUCT("q" AS n, 2 AS v) AS a)]) as x_1 ORDER BY n;