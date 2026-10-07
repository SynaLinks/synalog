ATTACH DATABASE ':memory:' AS logica_test;

DROP TABLE IF EXISTS logica_test.T;
CREATE TABLE logica_test.T AS SELECT
  SUM(x_2.value) AS t
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_2;

-- Interacting with table logica_test.T

SELECT
  t_0_T.t AS a,
  t_1_T.t AS b
FROM
  logica_test.T AS t_0_T, logica_test.T AS t_1_T;