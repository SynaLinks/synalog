DROP TABLE IF EXISTS logica_test.T;
CREATE TABLE logica_test.T AS SELECT
  SUM(x_2) AS t
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_2);

-- Interacting with table logica_test.T

SELECT
  t_0_T.t AS a,
  t_1_T.t AS b
FROM
  logica_test.T AS t_0_T, logica_test.T AS t_1_T;