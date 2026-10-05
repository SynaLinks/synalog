DROP TABLE IF EXISTS logica_test.S_fr0;
CREATE TABLE logica_test.S_fr0 AS WITH t_0_S_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      0 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S_MultBodyAggAux_f1.x AS x,
  MIN(S_MultBodyAggAux_f1.s) AS s
FROM
  t_0_S_MultBodyAggAux_f1 AS S_MultBodyAggAux_f1
GROUP BY 1;

-- Interacting with table logica_test.S_fr0

DROP TABLE IF EXISTS logica_test.S_fr1;
CREATE TABLE logica_test.S_fr1 AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_S_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      0 AS s
   UNION ALL
  
    SELECT
      E.b AS x,
      ((S_fr0.s) + (1)) AS s
    FROM
      logica_test.S_fr0 AS S_fr0, t_1_E AS E
    WHERE
      (E.a = S_fr0.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S_MultBodyAggAux_f2.x AS x,
  MIN(S_MultBodyAggAux_f2.s) AS s
FROM
  t_0_S_MultBodyAggAux_f2 AS S_MultBodyAggAux_f2
GROUP BY 1;

-- Interacting with table logica_test.S_fr1

DROP TABLE IF EXISTS logica_test.S_fr2;
CREATE TABLE logica_test.S_fr2 AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_S_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      0 AS s
   UNION ALL
  
    SELECT
      E.b AS x,
      ((S_fr1.s) + (1)) AS s
    FROM
      logica_test.S_fr1 AS S_fr1, t_1_E AS E
    WHERE
      (E.a = S_fr1.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S_MultBodyAggAux_f3.x AS x,
  MIN(S_MultBodyAggAux_f3.s) AS s
FROM
  t_0_S_MultBodyAggAux_f3 AS S_MultBodyAggAux_f3
GROUP BY 1;

-- Interacting with table logica_test.S_fr2

DROP TABLE IF EXISTS logica_test.S_fr3;
CREATE TABLE logica_test.S_fr3 AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_S_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      0 AS s
   UNION ALL
  
    SELECT
      E.b AS x,
      ((S_fr2.s) + (1)) AS s
    FROM
      logica_test.S_fr2 AS S_fr2, t_1_E AS E
    WHERE
      (E.a = S_fr2.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S_MultBodyAggAux_f4.x AS x,
  MIN(S_MultBodyAggAux_f4.s) AS s
FROM
  t_0_S_MultBodyAggAux_f4 AS S_MultBodyAggAux_f4
GROUP BY 1;

-- Interacting with table logica_test.S_fr3

DROP TABLE IF EXISTS logica_test.S_fr4;
CREATE TABLE logica_test.S_fr4 AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_S_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      0 AS s
   UNION ALL
  
    SELECT
      E.b AS x,
      ((S_fr3.s) + (1)) AS s
    FROM
      logica_test.S_fr3 AS S_fr3, t_1_E AS E
    WHERE
      (E.a = S_fr3.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S_MultBodyAggAux_f5.x AS x,
  MIN(S_MultBodyAggAux_f5.s) AS s
FROM
  t_0_S_MultBodyAggAux_f5 AS S_MultBodyAggAux_f5
GROUP BY 1;

-- Interacting with table logica_test.S_fr4

WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_S_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      0 AS s
   UNION ALL
  
    SELECT
      E.b AS x,
      ((S_fr4.s) + (1)) AS s
    FROM
      logica_test.S_fr4 AS S_fr4, t_1_E AS E
    WHERE
      (E.a = S_fr4.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S_MultBodyAggAux_f6.x AS x,
  MIN(S_MultBodyAggAux_f6.s) AS s
FROM
  t_0_S_MultBodyAggAux_f6 AS S_MultBodyAggAux_f6
GROUP BY 1 ORDER BY x;