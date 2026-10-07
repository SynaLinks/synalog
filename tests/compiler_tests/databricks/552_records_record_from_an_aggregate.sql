WITH t_0_S AS (SELECT
  MIN(x_5) AS lo,
  MAX(x_5) AS hi
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_5) AS pushkin)
SELECT
  S.lo AS lo,
  S.hi AS hi
FROM
  t_0_S AS S;