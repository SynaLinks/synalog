ATTACH DATABASE ':memory:' AS synalog_home;

DROP TABLE IF EXISTS synalog_home.T;
CREATE TABLE synalog_home.T AS SELECT
  SUM(x_2.value) AS t
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_2;

-- Interacting with table synalog_home.T

SELECT
  t_0_T.t AS a,
  t_1_T.t AS b
FROM
  synalog_home.T AS t_0_T, synalog_home.T AS t_1_T;