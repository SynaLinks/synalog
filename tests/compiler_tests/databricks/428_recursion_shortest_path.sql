DROP TABLE IF EXISTS logica_test.Dist_ifr0;
CREATE TABLE logica_test.Dist_ifr0 AS WITH t_0_Dist_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      "a" AS n,
      0 AS d
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_f1.n AS n,
  MIN(Dist_MultBodyAggAux_f1.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_f1 AS Dist_MultBodyAggAux_f1
GROUP BY 1;

-- Interacting with table logica_test.Dist_ifr0

DROP TABLE IF EXISTS logica_test.Dist_ifr1;
CREATE TABLE logica_test.Dist_ifr1 AS WITH t_1_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c"),
  ("a", "d"),
  ("d", "c")
AS UNUSED_TABLE_NAME(a, b)),
t_0_Dist_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      "a" AS n,
      0 AS d
   UNION ALL
  
    SELECT
      E.b AS n,
      ((Dist_ifr0.d) + (1)) AS d
    FROM
      logica_test.Dist_ifr0 AS Dist_ifr0, t_1_E AS E
    WHERE
      (E.a = Dist_ifr0.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_f2.n AS n,
  MIN(Dist_MultBodyAggAux_f2.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_f2 AS Dist_MultBodyAggAux_f2
GROUP BY 1;

-- Interacting with table logica_test.Dist_ifr1

DROP TABLE IF EXISTS logica_test.Dist_ifr2;
CREATE TABLE logica_test.Dist_ifr2 AS WITH t_1_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c"),
  ("a", "d"),
  ("d", "c")
AS UNUSED_TABLE_NAME(a, b)),
t_0_Dist_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      "a" AS n,
      0 AS d
   UNION ALL
  
    SELECT
      E.b AS n,
      ((Dist_ifr1.d) + (1)) AS d
    FROM
      logica_test.Dist_ifr1 AS Dist_ifr1, t_1_E AS E
    WHERE
      (E.a = Dist_ifr1.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_f3.n AS n,
  MIN(Dist_MultBodyAggAux_f3.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_f3 AS Dist_MultBodyAggAux_f3
GROUP BY 1;

-- Interacting with table logica_test.Dist_ifr2

DROP TABLE IF EXISTS logica_test.Dist_ifr1;
CREATE TABLE logica_test.Dist_ifr1 AS WITH t_1_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c"),
  ("a", "d"),
  ("d", "c")
AS UNUSED_TABLE_NAME(a, b)),
t_0_Dist_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      "a" AS n,
      0 AS d
   UNION ALL
  
    SELECT
      E.b AS n,
      ((Dist_ifr2.d) + (1)) AS d
    FROM
      logica_test.Dist_ifr2 AS Dist_ifr2, t_1_E AS E
    WHERE
      (E.a = Dist_ifr2.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_f4.n AS n,
  MIN(Dist_MultBodyAggAux_f4.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_f4 AS Dist_MultBodyAggAux_f4
GROUP BY 1;

-- Interacting with table logica_test.Dist_ifr1

DROP TABLE IF EXISTS logica_test.Dist_ifr2;
CREATE TABLE logica_test.Dist_ifr2 AS WITH t_1_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c"),
  ("a", "d"),
  ("d", "c")
AS UNUSED_TABLE_NAME(a, b)),
t_0_Dist_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      "a" AS n,
      0 AS d
   UNION ALL
  
    SELECT
      E.b AS n,
      ((Dist_ifr1.d) + (1)) AS d
    FROM
      logica_test.Dist_ifr1 AS Dist_ifr1, t_1_E AS E
    WHERE
      (E.a = Dist_ifr1.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_f3.n AS n,
  MIN(Dist_MultBodyAggAux_f3.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_f3 AS Dist_MultBodyAggAux_f3
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.Dist_ifr1;
CREATE TABLE logica_test.Dist_ifr1 AS WITH t_1_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c"),
  ("a", "d"),
  ("d", "c")
AS UNUSED_TABLE_NAME(a, b)),
t_0_Dist_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      "a" AS n,
      0 AS d
   UNION ALL
  
    SELECT
      E.b AS n,
      ((Dist_ifr2.d) + (1)) AS d
    FROM
      logica_test.Dist_ifr2 AS Dist_ifr2, t_1_E AS E
    WHERE
      (E.a = Dist_ifr2.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_f4.n AS n,
  MIN(Dist_MultBodyAggAux_f4.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_f4 AS Dist_MultBodyAggAux_f4
GROUP BY 1;

WITH t_1_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c"),
  ("a", "d"),
  ("d", "c")
AS UNUSED_TABLE_NAME(a, b)),
t_0_Dist_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      "a" AS n,
      0 AS d
   UNION ALL
  
    SELECT
      E.b AS n,
      ((Dist_ifr3.d) + (1)) AS d
    FROM
      logica_test.Dist_ifr1 AS Dist_ifr3, t_1_E AS E
    WHERE
      (E.a = Dist_ifr3.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_f5.n AS n,
  MIN(Dist_MultBodyAggAux_f5.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_f5 AS Dist_MultBodyAggAux_f5
GROUP BY 1 ORDER BY n NULLS LAST;