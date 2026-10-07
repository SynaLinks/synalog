DROP TABLE IF EXISTS logica_test.D_ifr0;
CREATE TABLE logica_test.D_ifr0 AS WITH t_0_D_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS d
  
) AS UNUSED_TABLE_NAME  )
SELECT
  D_MultBodyAggAux_f1.n AS n,
  MIN(D_MultBodyAggAux_f1.d) AS d
FROM
  t_0_D_MultBodyAggAux_f1 AS D_MultBodyAggAux_f1
GROUP BY 1;

-- Interacting with table logica_test.D_ifr0

DROP TABLE IF EXISTS logica_test.D_ifr1;
CREATE TABLE logica_test.D_ifr1 AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_D_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS d
   UNION ALL
  
    SELECT
      E.b AS n,
      ((D_ifr0.d) + (1)) AS d
    FROM
      logica_test.D_ifr0 AS D_ifr0, t_1_E AS E
    WHERE
      (E.a = D_ifr0.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  D_MultBodyAggAux_f2.n AS n,
  MIN(D_MultBodyAggAux_f2.d) AS d
FROM
  t_0_D_MultBodyAggAux_f2 AS D_MultBodyAggAux_f2
GROUP BY 1;

-- Interacting with table logica_test.D_ifr1

DROP TABLE IF EXISTS logica_test.D_ifr2;
CREATE TABLE logica_test.D_ifr2 AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_D_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS d
   UNION ALL
  
    SELECT
      E.b AS n,
      ((D_ifr1.d) + (1)) AS d
    FROM
      logica_test.D_ifr1 AS D_ifr1, t_1_E AS E
    WHERE
      (E.a = D_ifr1.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  D_MultBodyAggAux_f3.n AS n,
  MIN(D_MultBodyAggAux_f3.d) AS d
FROM
  t_0_D_MultBodyAggAux_f3 AS D_MultBodyAggAux_f3
GROUP BY 1;

-- Interacting with table logica_test.D_ifr2

DROP TABLE IF EXISTS logica_test.D_ifr1;
CREATE TABLE logica_test.D_ifr1 AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_D_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS d
   UNION ALL
  
    SELECT
      E.b AS n,
      ((D_ifr2.d) + (1)) AS d
    FROM
      logica_test.D_ifr2 AS D_ifr2, t_1_E AS E
    WHERE
      (E.a = D_ifr2.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  D_MultBodyAggAux_f4.n AS n,
  MIN(D_MultBodyAggAux_f4.d) AS d
FROM
  t_0_D_MultBodyAggAux_f4 AS D_MultBodyAggAux_f4
GROUP BY 1;

-- Interacting with table logica_test.D_ifr1

DROP TABLE IF EXISTS logica_test.D_ifr2;
CREATE TABLE logica_test.D_ifr2 AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_D_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS d
   UNION ALL
  
    SELECT
      E.b AS n,
      ((D_ifr1.d) + (1)) AS d
    FROM
      logica_test.D_ifr1 AS D_ifr1, t_1_E AS E
    WHERE
      (E.a = D_ifr1.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  D_MultBodyAggAux_f3.n AS n,
  MIN(D_MultBodyAggAux_f3.d) AS d
FROM
  t_0_D_MultBodyAggAux_f3 AS D_MultBodyAggAux_f3
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.D_ifr1;
CREATE TABLE logica_test.D_ifr1 AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_D_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS d
   UNION ALL
  
    SELECT
      E.b AS n,
      ((D_ifr2.d) + (1)) AS d
    FROM
      logica_test.D_ifr2 AS D_ifr2, t_1_E AS E
    WHERE
      (E.a = D_ifr2.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  D_MultBodyAggAux_f4.n AS n,
  MIN(D_MultBodyAggAux_f4.d) AS d
FROM
  t_0_D_MultBodyAggAux_f4 AS D_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.D_ifr2;
CREATE TABLE logica_test.D_ifr2 AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_D_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS d
   UNION ALL
  
    SELECT
      E.b AS n,
      ((D_ifr1.d) + (1)) AS d
    FROM
      logica_test.D_ifr1 AS D_ifr1, t_1_E AS E
    WHERE
      (E.a = D_ifr1.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  D_MultBodyAggAux_f3.n AS n,
  MIN(D_MultBodyAggAux_f3.d) AS d
FROM
  t_0_D_MultBodyAggAux_f3 AS D_MultBodyAggAux_f3
GROUP BY 1;

DROP TABLE IF EXISTS logica_test.D_ifr1;
CREATE TABLE logica_test.D_ifr1 AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_D_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS d
   UNION ALL
  
    SELECT
      E.b AS n,
      ((D_ifr2.d) + (1)) AS d
    FROM
      logica_test.D_ifr2 AS D_ifr2, t_1_E AS E
    WHERE
      (E.a = D_ifr2.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  D_MultBodyAggAux_f4.n AS n,
  MIN(D_MultBodyAggAux_f4.d) AS d
FROM
  t_0_D_MultBodyAggAux_f4 AS D_MultBodyAggAux_f4
GROUP BY 1;

WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_D_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS d
   UNION ALL
  
    SELECT
      E.b AS n,
      ((D_ifr3.d) + (1)) AS d
    FROM
      logica_test.D_ifr1 AS D_ifr3, t_1_E AS E
    WHERE
      (E.a = D_ifr3.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  D_MultBodyAggAux_f5.n AS n,
  MIN(D_MultBodyAggAux_f5.d) AS d
FROM
  t_0_D_MultBodyAggAux_f5 AS D_MultBodyAggAux_f5
GROUP BY 1 ORDER BY n;