DROP TABLE IF EXISTS logica_test.Reachable_ifr0;
CREATE TABLE logica_test.Reachable_ifr0 AS WITH t_0_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 6),
  (6, 7)
AS UNUSED_TABLE_NAME(col0, col1))
SELECT * FROM (
  
    SELECT
      Edge.col0 AS col0,
      Edge.col1 AS col1
    FROM
      t_0_Edge AS Edge
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Reachable_ifr0

DROP TABLE IF EXISTS logica_test.Reachable_ifr1;
CREATE TABLE logica_test.Reachable_ifr1 AS WITH t_0_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 6),
  (6, 7)
AS UNUSED_TABLE_NAME(col0, col1))
SELECT * FROM (
  
    SELECT
      Edge.col0 AS col0,
      Edge.col1 AS col1
    FROM
      t_0_Edge AS Edge
   UNION ALL
  
    SELECT
      Reachable_ifr0.col0 AS col0,
      t_0_Edge.col1 AS col1
    FROM
      logica_test.Reachable_ifr0 AS Reachable_ifr0, t_0_Edge
    WHERE
      (t_0_Edge.col0 = Reachable_ifr0.col1)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Reachable_ifr1

DROP TABLE IF EXISTS logica_test.Reachable_ifr2;
CREATE TABLE logica_test.Reachable_ifr2 AS WITH t_0_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 6),
  (6, 7)
AS UNUSED_TABLE_NAME(col0, col1))
SELECT * FROM (
  
    SELECT
      Edge.col0 AS col0,
      Edge.col1 AS col1
    FROM
      t_0_Edge AS Edge
   UNION ALL
  
    SELECT
      Reachable_ifr1.col0 AS col0,
      t_0_Edge.col1 AS col1
    FROM
      logica_test.Reachable_ifr1 AS Reachable_ifr1, t_0_Edge
    WHERE
      (t_0_Edge.col0 = Reachable_ifr1.col1)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Reachable_ifr2

DROP TABLE IF EXISTS logica_test.Reachable_ifr1;
CREATE TABLE logica_test.Reachable_ifr1 AS WITH t_0_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 6),
  (6, 7)
AS UNUSED_TABLE_NAME(col0, col1))
SELECT * FROM (
  
    SELECT
      Edge.col0 AS col0,
      Edge.col1 AS col1
    FROM
      t_0_Edge AS Edge
   UNION ALL
  
    SELECT
      Reachable_ifr2.col0 AS col0,
      t_0_Edge.col1 AS col1
    FROM
      logica_test.Reachable_ifr2 AS Reachable_ifr2, t_0_Edge
    WHERE
      (t_0_Edge.col0 = Reachable_ifr2.col1)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Reachable_ifr1

DROP TABLE IF EXISTS logica_test.Reachable_ifr2;
CREATE TABLE logica_test.Reachable_ifr2 AS WITH t_0_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 6),
  (6, 7)
AS UNUSED_TABLE_NAME(col0, col1))
SELECT * FROM (
  
    SELECT
      Edge.col0 AS col0,
      Edge.col1 AS col1
    FROM
      t_0_Edge AS Edge
   UNION ALL
  
    SELECT
      Reachable_ifr1.col0 AS col0,
      t_0_Edge.col1 AS col1
    FROM
      logica_test.Reachable_ifr1 AS Reachable_ifr1, t_0_Edge
    WHERE
      (t_0_Edge.col0 = Reachable_ifr1.col1)
  
) AS UNUSED_TABLE_NAME  ;

DROP TABLE IF EXISTS logica_test.Reachable_ifr1;
CREATE TABLE logica_test.Reachable_ifr1 AS WITH t_0_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 6),
  (6, 7)
AS UNUSED_TABLE_NAME(col0, col1))
SELECT * FROM (
  
    SELECT
      Edge.col0 AS col0,
      Edge.col1 AS col1
    FROM
      t_0_Edge AS Edge
   UNION ALL
  
    SELECT
      Reachable_ifr2.col0 AS col0,
      t_0_Edge.col1 AS col1
    FROM
      logica_test.Reachable_ifr2 AS Reachable_ifr2, t_0_Edge
    WHERE
      (t_0_Edge.col0 = Reachable_ifr2.col1)
  
) AS UNUSED_TABLE_NAME  ;

DROP TABLE IF EXISTS logica_test.Reachable_ifr2;
CREATE TABLE logica_test.Reachable_ifr2 AS WITH t_0_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 6),
  (6, 7)
AS UNUSED_TABLE_NAME(col0, col1))
SELECT * FROM (
  
    SELECT
      Edge.col0 AS col0,
      Edge.col1 AS col1
    FROM
      t_0_Edge AS Edge
   UNION ALL
  
    SELECT
      Reachable_ifr1.col0 AS col0,
      t_0_Edge.col1 AS col1
    FROM
      logica_test.Reachable_ifr1 AS Reachable_ifr1, t_0_Edge
    WHERE
      (t_0_Edge.col0 = Reachable_ifr1.col1)
  
) AS UNUSED_TABLE_NAME  ;

DROP TABLE IF EXISTS logica_test.Reachable_ifr1;
CREATE TABLE logica_test.Reachable_ifr1 AS WITH t_0_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 6),
  (6, 7)
AS UNUSED_TABLE_NAME(col0, col1))
SELECT * FROM (
  
    SELECT
      Edge.col0 AS col0,
      Edge.col1 AS col1
    FROM
      t_0_Edge AS Edge
   UNION ALL
  
    SELECT
      Reachable_ifr2.col0 AS col0,
      t_0_Edge.col1 AS col1
    FROM
      logica_test.Reachable_ifr2 AS Reachable_ifr2, t_0_Edge
    WHERE
      (t_0_Edge.col0 = Reachable_ifr2.col1)
  
) AS UNUSED_TABLE_NAME  ;

DROP TABLE IF EXISTS logica_test.Reachable_ifr2;
CREATE TABLE logica_test.Reachable_ifr2 AS WITH t_0_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 6),
  (6, 7)
AS UNUSED_TABLE_NAME(col0, col1))
SELECT * FROM (
  
    SELECT
      Edge.col0 AS col0,
      Edge.col1 AS col1
    FROM
      t_0_Edge AS Edge
   UNION ALL
  
    SELECT
      Reachable_ifr1.col0 AS col0,
      t_0_Edge.col1 AS col1
    FROM
      logica_test.Reachable_ifr1 AS Reachable_ifr1, t_0_Edge
    WHERE
      (t_0_Edge.col0 = Reachable_ifr1.col1)
  
) AS UNUSED_TABLE_NAME  ;

DROP TABLE IF EXISTS logica_test.Reachable_ifr1;
CREATE TABLE logica_test.Reachable_ifr1 AS WITH t_0_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 6),
  (6, 7)
AS UNUSED_TABLE_NAME(col0, col1))
SELECT * FROM (
  
    SELECT
      Edge.col0 AS col0,
      Edge.col1 AS col1
    FROM
      t_0_Edge AS Edge
   UNION ALL
  
    SELECT
      Reachable_ifr2.col0 AS col0,
      t_0_Edge.col1 AS col1
    FROM
      logica_test.Reachable_ifr2 AS Reachable_ifr2, t_0_Edge
    WHERE
      (t_0_Edge.col0 = Reachable_ifr2.col1)
  
) AS UNUSED_TABLE_NAME  ;

DROP TABLE IF EXISTS logica_test.Reachable;
CREATE TABLE logica_test.Reachable AS WITH t_0_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 6),
  (6, 7)
AS UNUSED_TABLE_NAME(col0, col1))
SELECT * FROM (
  
    SELECT
      Edge.col0 AS col0,
      Edge.col1 AS col1
    FROM
      t_0_Edge AS Edge
   UNION ALL
  
    SELECT
      Reachable_ifr3.col0 AS col0,
      t_1_Edge.col1 AS col1
    FROM
      logica_test.Reachable_ifr1 AS Reachable_ifr3, t_0_Edge AS t_1_Edge
    WHERE
      (t_1_Edge.col0 = Reachable_ifr3.col1)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Reachable

SELECT
  Reachable.col0 AS x,
  Reachable.col1 AS y
FROM
  logica_test.Reachable AS Reachable ORDER BY x NULLS LAST, y NULLS LAST;