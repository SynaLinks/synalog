DROP TABLE IF EXISTS logica_test.C0;
CREATE TABLE logica_test.C0 AS SELECT
  x_1 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3, 4, 5, 6, 7, 8], synalog_e -> ROW(synalog_e))) as pushkin(x_1);

-- Interacting with table logica_test.C0

DROP TABLE IF EXISTS logica_test.C3;
CREATE TABLE logica_test.C3 AS SELECT
  C0.x AS x
FROM
  logica_test.C0 AS C0
WHERE
  (C0.x != 3) AND
  (C0.x != 2) AND
  (C0.x != 1);

-- Interacting with table logica_test.C3

SELECT
  C3.x AS x
FROM
  logica_test.C3 AS C3 ORDER BY x;