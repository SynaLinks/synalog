DROP TABLE IF EXISTS logica_test.C_fr0;
CREATE TABLE logica_test.C_fr0 AS WITH t_0_C_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f1.n) AS n
FROM
  t_0_C_MultBodyAggAux_f1 AS C_MultBodyAggAux_f1;

-- Interacting with table logica_test.C_fr0

DROP TABLE IF EXISTS logica_test.C_fr1;
CREATE TABLE logica_test.C_fr1 AS WITH t_0_C_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      ((C_fr0.n) + (1)) AS n
    FROM
      logica_test.C_fr0 AS C_fr0
    WHERE
      (C_fr0.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f2.n) AS n
FROM
  t_0_C_MultBodyAggAux_f2 AS C_MultBodyAggAux_f2;

-- Interacting with table logica_test.C_fr1

DROP TABLE IF EXISTS logica_test.C_fr2;
CREATE TABLE logica_test.C_fr2 AS WITH t_0_C_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      ((C_fr1.n) + (1)) AS n
    FROM
      logica_test.C_fr1 AS C_fr1
    WHERE
      (C_fr1.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f3.n) AS n
FROM
  t_0_C_MultBodyAggAux_f3 AS C_MultBodyAggAux_f3;

-- Interacting with table logica_test.C_fr2

WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_fr2.n) + (1)) AS n
    FROM
      logica_test.C_fr2 AS C_fr2
    WHERE
      (C_fr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;