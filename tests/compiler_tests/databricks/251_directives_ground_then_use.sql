DROP TABLE IF EXISTS synalog_home.V;
CREATE TABLE synalog_home.V AS SELECT
  x_1 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_1) AS pushkin;

-- Interacting with table synalog_home.V

SELECT
  ((V.x) * (2)) AS y
FROM
  synalog_home.V AS V ORDER BY y NULLS LAST;