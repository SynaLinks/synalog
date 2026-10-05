DROP TABLE IF EXISTS logica_test.Step1;
CREATE TABLE logica_test.Step1 AS SELECT
  x_4 AS col0,
  ((x_4) + (1)) AS col1
FROM
  UNNEST(FILTER(SEQUENCE(0, 5), x -> x < 5)) as pushkin(x_4);

-- Interacting with table logica_test.Step1

SELECT
  Step1.col0 AS col0,
  Step1.col1 AS col1
FROM
  logica_test.Step1 AS Step1 ORDER BY col0;