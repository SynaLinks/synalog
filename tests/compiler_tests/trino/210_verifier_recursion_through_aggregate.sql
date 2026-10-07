DROP TABLE IF EXISTS logica_test.Count_fr0;
CREATE TABLE logica_test.Count_fr0 AS WITH t_0_Count_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(Count_MultBodyAggAux_f1.n) AS n
FROM
  t_0_Count_MultBodyAggAux_f1 AS Count_MultBodyAggAux_f1;

-- Interacting with table logica_test.Count_fr0

DROP TABLE IF EXISTS logica_test.Count_fr1;
CREATE TABLE logica_test.Count_fr1 AS WITH t_0_Count_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      ((Count_fr0.n) + (1)) AS n
    FROM
      logica_test.Count_fr0 AS Count_fr0
    WHERE
      (Count_fr0.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(Count_MultBodyAggAux_f2.n) AS n
FROM
  t_0_Count_MultBodyAggAux_f2 AS Count_MultBodyAggAux_f2;

-- Interacting with table logica_test.Count_fr1

DROP TABLE IF EXISTS logica_test.Count_fr2;
CREATE TABLE logica_test.Count_fr2 AS WITH t_0_Count_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      ((Count_fr1.n) + (1)) AS n
    FROM
      logica_test.Count_fr1 AS Count_fr1
    WHERE
      (Count_fr1.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(Count_MultBodyAggAux_f3.n) AS n
FROM
  t_0_Count_MultBodyAggAux_f3 AS Count_MultBodyAggAux_f3;

-- Interacting with table logica_test.Count_fr2

WITH t_0_Count_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((Count_fr2.n) + (1)) AS n
    FROM
      logica_test.Count_fr2 AS Count_fr2
    WHERE
      (Count_fr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(Count_MultBodyAggAux_f4.n) AS n
FROM
  t_0_Count_MultBodyAggAux_f4 AS Count_MultBodyAggAux_f4;