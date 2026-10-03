DROP TABLE IF EXISTS logica_test.Reach_ifr0;
CREATE TABLE logica_test.Reach_ifr0 AS WITH t_0_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1.x AS x,
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1, 2;

-- Interacting with table logica_test.Reach_ifr0

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr0.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr0 AS Reach_ifr0, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr0.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2;

-- Interacting with table logica_test.Reach_ifr1

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

-- Interacting with table logica_test.Reach_ifr2

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

-- Interacting with table logica_test.Reach_ifr1

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS logica_test.Reach;
CREATE TABLE logica_test.Reach AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_9)
   UNION ALL
  
    SELECT
      Reach_ifr3.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr3, UNNEST(SEQUENCE(0, 4 - 1)) as pushkin(x_17)
    WHERE
      (Reach_ifr3.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.x AS x,
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1, 2;

-- Interacting with table logica_test.Reach

SELECT
  SUM(1) AS n
FROM
  logica_test.Reach AS Reach;