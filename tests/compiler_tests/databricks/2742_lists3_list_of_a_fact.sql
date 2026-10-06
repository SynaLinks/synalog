WITH t_1_T AS (SELECT
  SUM(x_4) AS t
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_4) AS pushkin)
SELECT
  3 AS n,
  t_0_T.t AS t
FROM
  t_1_T AS t_0_T;