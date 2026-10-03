DROP TABLE IF EXISTS logica_test.Reach_ifr0;
CREATE TABLE logica_test.Reach_ifr0 AS WITH t_0_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY y;

-- Interacting with table logica_test.Reach_ifr0

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr0 AS Reach_ifr0, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr0.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y;

-- Interacting with table logica_test.Reach_ifr1

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY y;

-- Interacting with table logica_test.Reach_ifr2

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY y;

-- Interacting with table logica_test.Reach_ifr1

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY y;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY y;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY y;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY y;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY y;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY y;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY y;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY y;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY y;

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY y;

DROP TABLE IF EXISTS logica_test.Reach;
CREATE TABLE logica_test.Reach AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr3, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (Reach_ifr3.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY y;

-- Interacting with table logica_test.Reach

SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[10, 22, 23]) as x_3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach AS Reach
  WHERE
    (Reach.y = x_3)) IS NULL) ORDER BY x;