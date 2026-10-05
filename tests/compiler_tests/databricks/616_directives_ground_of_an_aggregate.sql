DROP TABLE IF EXISTS logica_test.T;
CREATE TABLE logica_test.T AS SELECT
  SUM(x_2) AS t
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_2) AS pushkin;

-- Interacting with table logica_test.T

SELECT
  t_0_T.t AS a,
  t_1_T.t AS b
FROM
  logica_test.T AS t_0_T, logica_test.T AS t_1_T;