DROP TABLE IF EXISTS synalog_test.V;
CREATE TABLE synalog_test.V AS SELECT
  x_1 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_1) AS pushkin;

-- Interacting with table synalog_test.V

SELECT
  ((V.x) * (2)) AS y
FROM
  synalog_test.V AS V ORDER BY y NULLS LAST;