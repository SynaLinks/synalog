DROP TABLE IF EXISTS logica_test.V;
CREATE TABLE logica_test.V AS SELECT
  x_1 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_1);

-- Interacting with table logica_test.V

SELECT
  ((V.x) * (2)) AS y
FROM
  logica_test.V AS V ORDER BY y;