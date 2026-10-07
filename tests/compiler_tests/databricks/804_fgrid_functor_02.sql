WITH t_0_T0 AS (SELECT
  MAX(x_4) AS t
FROM
  LATERAL (SELECT explode(ARRAY(4, 5)) AS x_4) AS pushkin)
SELECT
  T0.t AS t
FROM
  t_0_T0 AS T0;