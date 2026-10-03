DROP TABLE IF EXISTS logica_test.Reach_ifr0;
CREATE TABLE logica_test.Reach_ifr0 AS WITH t_0_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1;

-- Interacting with table logica_test.Reach_ifr0

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr0 AS Reach_ifr0, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr0."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f2."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1;

-- Interacting with table logica_test.Reach_ifr1

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr1."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1;

-- Interacting with table logica_test.Reach_ifr2

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr2."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1;

-- Interacting with table logica_test.Reach_ifr3

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr3."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1;

-- Interacting with table logica_test.Reach_ifr2

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr2."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr3."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr2."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr3."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr2."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr3."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr2."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr3."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr2."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr3."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr2."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr3."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr2."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr3."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr2."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr3."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr2."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr3."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr2."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr3."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Reach;
CREATE TABLE logica_test.Reach AS WITH t_0_Reach_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS "to"
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr4, UNNEST(SEQUENCE(0, 100 - 1)) as pushkin(x_7)
    WHERE
      (Reach_ifr4."to" = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f6."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f6 AS Reach_MultBodyAggAux_f6
GROUP BY 1;

-- Interacting with table logica_test.Reach

SELECT
  MAX(Reach."to") AS m
FROM
  logica_test.Reach AS Reach;