DROP TABLE IF EXISTS synalog_home.synalog_home.Step1;
CREATE TABLE synalog_home.synalog_home.Step1 AS SELECT
  x_4 AS col0,
  ((x_4) + (1)) AS col1
FROM
  UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 5), x -> x < 5), synalog_e -> ROW(synalog_e))) as pushkin(x_4);

-- Interacting with table synalog_home.synalog_home.Step1

SELECT
  Step1.col0 AS col0,
  Step1.col1 AS col1
FROM
  synalog_home.synalog_home.Step1 AS Step1 ORDER BY col0;