DROP TABLE IF EXISTS synalog_test.V;
CREATE TABLE synalog_test.V AS SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2]) as x_3;

-- Interacting with table synalog_test.V

SELECT
  ((V.x) * (2)) AS y
FROM
  synalog_test.V AS V ORDER BY y;