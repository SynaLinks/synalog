DROP TABLE IF EXISTS logica_test.Test_ifr0;
CREATE TABLE logica_test.Test_ifr0 AS WITH t_0_Test_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f1.y AS y
FROM
  t_0_Test_MultBodyAggAux_f1 AS Test_MultBodyAggAux_f1
GROUP BY 1;

-- Interacting with table logica_test.Test_ifr0

DROP TABLE IF EXISTS logica_test.Test_ifr1;
CREATE TABLE logica_test.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr0 AS Test_ifr0, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr0.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_0_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY 1;

-- Interacting with table logica_test.Test_ifr1

DROP TABLE IF EXISTS logica_test.Test_ifr2;
CREATE TABLE logica_test.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr1 AS Test_ifr1, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY 1;

-- Interacting with table logica_test.Test_ifr2

DROP TABLE IF EXISTS logica_test.Test_ifr1;
CREATE TABLE logica_test.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr2 AS Test_ifr2, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY 1;

-- Interacting with table logica_test.Test_ifr1

DROP TABLE IF EXISTS logica_test.Test_ifr2;
CREATE TABLE logica_test.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr1 AS Test_ifr1, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr1;
CREATE TABLE logica_test.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr2 AS Test_ifr2, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr2;
CREATE TABLE logica_test.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr1 AS Test_ifr1, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr1;
CREATE TABLE logica_test.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr2 AS Test_ifr2, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr2;
CREATE TABLE logica_test.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr1 AS Test_ifr1, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr1;
CREATE TABLE logica_test.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr2 AS Test_ifr2, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr2;
CREATE TABLE logica_test.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr1 AS Test_ifr1, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr1;
CREATE TABLE logica_test.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr2 AS Test_ifr2, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr2;
CREATE TABLE logica_test.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr1 AS Test_ifr1, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr1;
CREATE TABLE logica_test.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr2 AS Test_ifr2, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr2;
CREATE TABLE logica_test.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr1 AS Test_ifr1, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr1;
CREATE TABLE logica_test.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr2 AS Test_ifr2, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr2;
CREATE TABLE logica_test.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr1 AS Test_ifr1, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr1;
CREATE TABLE logica_test.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr2 AS Test_ifr2, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr2;
CREATE TABLE logica_test.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr1 AS Test_ifr1, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr1;
CREATE TABLE logica_test.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr2 AS Test_ifr2, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr2;
CREATE TABLE logica_test.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr1 AS Test_ifr1, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr1;
CREATE TABLE logica_test.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr2 AS Test_ifr2, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr2;
CREATE TABLE logica_test.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr1 AS Test_ifr1, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr1;
CREATE TABLE logica_test.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr2 AS Test_ifr2, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr2;
CREATE TABLE logica_test.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr1 AS Test_ifr1, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr1;
CREATE TABLE logica_test.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr2 AS Test_ifr2, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr2;
CREATE TABLE logica_test.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr1 AS Test_ifr1, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr1;
CREATE TABLE logica_test.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr2 AS Test_ifr2, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr2;
CREATE TABLE logica_test.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr1 AS Test_ifr1, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Test_ifr1;
CREATE TABLE logica_test.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr2 AS Test_ifr2, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY 1;

WITH t_0_Test_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Test_ifr1 AS Test_ifr3, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_7)
    WHERE
      (Test_ifr3.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f5.y AS y
FROM
  t_0_Test_MultBodyAggAux_f5 AS Test_MultBodyAggAux_f5
GROUP BY 1;