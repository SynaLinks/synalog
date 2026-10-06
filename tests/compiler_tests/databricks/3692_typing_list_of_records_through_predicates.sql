WITH t_3_V AS (SELECT * FROM VALUES
  ("a", 1),
  ("b", 2)
AS UNUSED_TABLE_NAME(n, v)),
t_1_L AS (SELECT
  ARRAY_AGG(STRUCT(t_2_V.n AS n, t_2_V.v AS v)) AS l
FROM
  t_3_V AS t_2_V)
SELECT
  x_1.n AS n,
  x_1.v AS v
FROM
  t_1_L AS t_0_L, LATERAL (SELECT explode(t_0_L.l) AS x_1) AS pushkin ORDER BY n NULLS LAST;