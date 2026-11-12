ATTACH DATABASE ':memory:' AS synalog_home;

DROP TABLE IF EXISTS synalog_home.V;
CREATE TABLE synalog_home.V AS SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_3;

-- Interacting with table synalog_home.V

SELECT
  ((V.x) * (2)) AS y
FROM
  synalog_home.V AS V ORDER BY y;