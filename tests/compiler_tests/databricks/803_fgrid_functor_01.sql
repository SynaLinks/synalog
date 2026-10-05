WITH t_0_T0 AS (SELECT
  SUM(x_4) AS t
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_4) AS pushkin)
SELECT
  T0.t AS t
FROM
  t_0_T0 AS T0;