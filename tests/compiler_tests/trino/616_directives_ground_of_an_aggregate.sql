DROP TABLE IF EXISTS synalog_test.T;
CREATE TABLE synalog_test.T AS SELECT
  SUM(x_2) AS t
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_2);

-- Interacting with table synalog_test.T

SELECT
  t_0_T.t AS a,
  t_1_T.t AS b
FROM
  synalog_test.T AS t_0_T, synalog_test.T AS t_1_T;