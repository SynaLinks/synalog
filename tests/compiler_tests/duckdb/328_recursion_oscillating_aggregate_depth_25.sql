-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

DROP TABLE IF EXISTS logica_home.C_ifr0;
CREATE TABLE logica_home.C_ifr0 AS WITH t_0_C_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f1.n) AS n
FROM
  t_0_C_MultBodyAggAux_f1 AS C_MultBodyAggAux_f1;

-- Interacting with table logica_home.C_ifr0

DROP TABLE IF EXISTS logica_home.C_ifr1;
CREATE TABLE logica_home.C_ifr1 AS WITH t_0_C_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr0.n) + (1)) AS n
    FROM
      logica_home.C_ifr0 AS C_ifr0
    WHERE
      (C_ifr0.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f2.n) AS n
FROM
  t_0_C_MultBodyAggAux_f2 AS C_MultBodyAggAux_f2;

-- Interacting with table logica_home.C_ifr1

DROP TABLE IF EXISTS logica_home.C_ifr2;
CREATE TABLE logica_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr1.n) + (1)) AS n
    FROM
      logica_home.C_ifr1 AS C_ifr1
    WHERE
      (C_ifr1.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f3.n) AS n
FROM
  t_0_C_MultBodyAggAux_f3 AS C_MultBodyAggAux_f3;

-- Interacting with table logica_home.C_ifr2

DROP TABLE IF EXISTS logica_home.C_ifr3;
CREATE TABLE logica_home.C_ifr3 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      logica_home.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

-- Interacting with table logica_home.C_ifr3

DROP TABLE IF EXISTS logica_home.C_ifr2;
CREATE TABLE logica_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      logica_home.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

-- Interacting with table logica_home.C_ifr2

DROP TABLE IF EXISTS logica_home.C_ifr3;
CREATE TABLE logica_home.C_ifr3 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      logica_home.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS logica_home.C_ifr2;
CREATE TABLE logica_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      logica_home.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

DROP TABLE IF EXISTS logica_home.C_ifr3;
CREATE TABLE logica_home.C_ifr3 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      logica_home.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS logica_home.C_ifr2;
CREATE TABLE logica_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      logica_home.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

DROP TABLE IF EXISTS logica_home.C_ifr3;
CREATE TABLE logica_home.C_ifr3 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      logica_home.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS logica_home.C_ifr2;
CREATE TABLE logica_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      logica_home.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

DROP TABLE IF EXISTS logica_home.C_ifr3;
CREATE TABLE logica_home.C_ifr3 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      logica_home.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS logica_home.C_ifr2;
CREATE TABLE logica_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      logica_home.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

DROP TABLE IF EXISTS logica_home.C_ifr3;
CREATE TABLE logica_home.C_ifr3 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      logica_home.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS logica_home.C_ifr2;
CREATE TABLE logica_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      logica_home.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

DROP TABLE IF EXISTS logica_home.C_ifr3;
CREATE TABLE logica_home.C_ifr3 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      logica_home.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS logica_home.C_ifr2;
CREATE TABLE logica_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      logica_home.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

DROP TABLE IF EXISTS logica_home.C_ifr3;
CREATE TABLE logica_home.C_ifr3 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      logica_home.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS logica_home.C_ifr2;
CREATE TABLE logica_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      logica_home.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

DROP TABLE IF EXISTS logica_home.C_ifr3;
CREATE TABLE logica_home.C_ifr3 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      logica_home.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS logica_home.C_ifr2;
CREATE TABLE logica_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      logica_home.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

DROP TABLE IF EXISTS logica_home.C_ifr3;
CREATE TABLE logica_home.C_ifr3 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      logica_home.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS logica_home.C_ifr2;
CREATE TABLE logica_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      logica_home.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

DROP TABLE IF EXISTS logica_home.C_ifr3;
CREATE TABLE logica_home.C_ifr3 AS WITH t_0_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr2.n) + (1)) AS n
    FROM
      logica_home.C_ifr2 AS C_ifr2
    WHERE
      (C_ifr2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4;

DROP TABLE IF EXISTS logica_home.C_ifr2;
CREATE TABLE logica_home.C_ifr2 AS WITH t_0_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr3.n) + (1)) AS n
    FROM
      logica_home.C_ifr3 AS C_ifr3
    WHERE
      (C_ifr3.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f5.n) AS n
FROM
  t_0_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5;

WITH t_0_C_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      ((C_ifr4.n) + (1)) AS n
    FROM
      logica_home.C_ifr2 AS C_ifr4
    WHERE
      (C_ifr4.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_f6.n) AS n
FROM
  t_0_C_MultBodyAggAux_f6 AS C_MultBodyAggAux_f6;