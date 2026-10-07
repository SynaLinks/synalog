DROP TABLE IF EXISTS logica_test.V;
CREATE TABLE logica_test.V AS SELECT
  x_1 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_1) AS pushkin;

-- Interacting with table logica_test.V

SELECT
  ((V.x) * (2)) AS y
FROM
  logica_test.V AS V ORDER BY y NULLS LAST;