WITH t_1_A AS (SELECT
  AVG(x_3) AS a
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 4)) AS x_3) AS pushkin)
SELECT
  ROUND(t_0_A.a, 2) AS r
FROM
  t_1_A AS t_0_A;