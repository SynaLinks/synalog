DROP TABLE IF EXISTS logica_test.V;
CREATE TABLE logica_test.V AS SELECT
  x_3 AS x
FROM
  explode(ARRAY(1, 2)) AS pushkin(x_3);

-- Interacting with table logica_test.V

SELECT
  ((V.x) * (2)) AS y
FROM
  logica_test.V AS V ORDER BY y;