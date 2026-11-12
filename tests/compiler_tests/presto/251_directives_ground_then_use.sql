DROP TABLE IF EXISTS synalog_home.synalog_home.V;
CREATE TABLE synalog_home.synalog_home.V AS SELECT
  x_1 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_1);

-- Interacting with table synalog_home.synalog_home.V

SELECT
  ((V.x) * (2)) AS y
FROM
  synalog_home.synalog_home.V AS V ORDER BY y;