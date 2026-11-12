DROP TABLE IF EXISTS synalog_home.V;
CREATE TABLE synalog_home.V AS SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2]) as x_3;

-- Interacting with table synalog_home.V

SELECT
  ((V.x) * (2)) AS y
FROM
  synalog_home.V AS V ORDER BY y;