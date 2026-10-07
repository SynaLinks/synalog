DROP TABLE IF EXISTS logica_test.C0;
CREATE TABLE logica_test.C0 AS SELECT
  x_1 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) AS x_1) AS pushkin;

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

DROP TABLE IF EXISTS logica_test.C6;
CREATE TABLE logica_test.C6 AS SELECT
  C3.x AS x
FROM
  logica_test.C3 AS C3
WHERE
  (C3.x != 6) AND
  (C3.x != 5) AND
  (C3.x != 4);

-- Interacting with table logica_test.C6

DROP TABLE IF EXISTS logica_test.C9;
CREATE TABLE logica_test.C9 AS SELECT
  C6.x AS x
FROM
  logica_test.C6 AS C6
WHERE
  (C6.x != 9) AND
  (C6.x != 8) AND
  (C6.x != 7);

-- Interacting with table logica_test.C9

DROP TABLE IF EXISTS logica_test.C12;
CREATE TABLE logica_test.C12 AS SELECT
  C9.x AS x
FROM
  logica_test.C9 AS C9
WHERE
  (C9.x != 12) AND
  (C9.x != 11) AND
  (C9.x != 10);

-- Interacting with table logica_test.C12

DROP TABLE IF EXISTS logica_test.C15;
CREATE TABLE logica_test.C15 AS SELECT
  C12.x AS x
FROM
  logica_test.C12 AS C12
WHERE
  (C12.x != 15) AND
  (C12.x != 14) AND
  (C12.x != 13);

-- Interacting with table logica_test.C15

DROP TABLE IF EXISTS logica_test.C18;
CREATE TABLE logica_test.C18 AS SELECT
  C15.x AS x
FROM
  logica_test.C15 AS C15
WHERE
  (C15.x != 18) AND
  (C15.x != 17) AND
  (C15.x != 16);

-- Interacting with table logica_test.C18

SELECT
  C18.x AS x
FROM
  logica_test.C18 AS C18;
