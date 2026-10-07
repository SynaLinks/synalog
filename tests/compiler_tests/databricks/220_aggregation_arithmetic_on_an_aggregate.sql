WITH t_1_T AS (SELECT
  SUM(x_4) AS t
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_4) AS pushkin)
SELECT
  ((t_0_T.t) * (2)) AS d
FROM
  t_1_T AS t_0_T;